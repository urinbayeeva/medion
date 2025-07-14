import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/enums/user_status_enum.dart';
import 'package:medion/utils/enums/visits_enum.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final DBService _dbService;

  AuthBloc(
    this._repository,
    this._dbService,
  ) : super(const _AuthState()) {
    on<_VerificationSend>(_verificationSendHandler);
    on<_SendPhoneNumber>(_sendPhoneNumberHandler);
    on<_SendUserInfo>(_sendUserInfoHandler);
    on<_FetchPatientInfo>(_fetchPatientInfoHandler);
    on<_FetchPatientVisits>(_fetchPatientVisitsHandler);
    on<_FetchPatientVisitsDetail>(_fetchPatientVisitsSingle);
    on<_FetchPatientAnalyze>(_fetchPatientAnalyze);
    on<_FetchMyWallet>(_fetchMyWallet);
    on<_FetchRecommendation>(_fetchRecommendation);
    on<_FetchRecipes>(_fetchRecipes);
    on<_CheckAuth>(_checkAuth);
    on<_RefreshToken>(_refreshToken);
    on<_CancelVisit>(_cancelVisit);
  }

  FutureOr<void> _hasToken(Emitter<AuthState> emit) async {
    final token = _dbService.token;
    final access = token.accessToken;
    final refresh = token.refreshToken;
    if (access != null && access.isNotEmpty || refresh != null && refresh.isNotEmpty) {
      emit(state.copyWith(haveToken: access!.substring(0, 5)));
    } else {
      emit(state.copyWith(haveToken: ''));
    }
  }

  FutureOr<void> _refreshToken(_RefreshToken event, Emitter<AuthState> emit) async {
    debugPrint("*****Refresh token function");
    final oldDay = _dbService.getDay;
    final now = DateTime.now();
    final today = "${now.day}.${now.month}.${now.year}";
    final token = _dbService.token;
    final refresh = token.refreshToken;

    if (oldDay != today && refresh != null) {
      _dbService.setDay(today);
      final res = await _repository.refreshToken(refresh);
      res.fold(
        (failure) {
          debugPrint("*****Refresh token function Failure");
        },
        (data) {
          LogService.d("Refresh succeeded: access=${data.accessToken}");
          _dbService.setToken(Token(
            accessToken: data.accessToken,
            refreshToken: refresh,
            tokenType: data.tokenType,
          ));
        },
      );
    } else {
      debugPrint("send one tine in this day");
    }
  }

  FutureOr<void> _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    MyFunctions.initDeviceInfo(_dbService);
    _hasToken(emit);
    emit(state.copyWith(userStatus: UserStatus.unknown));
    final res = await _repository.getPatientInfo();

    final token = _dbService.token;
    final access = token.accessToken;
    final refresh = token.refreshToken;

    if (access != null && access.isNotEmpty && refresh != null && refresh.isNotEmpty) {
      res.fold(
        (failure) {
          if (failure.message.contains("invalid") || failure.message.contains("credential")) {
            emit(state.copyWith(userStatus: UserStatus.unAuthed));
            _dbService.setLang(isSaved: false);
          }
        },
        (success) {
          emit(state.copyWith(userStatus: UserStatus.authed));
        },
      );
    } else {
      emit(state.copyWith(userStatus: UserStatus.unAuthed));
    }
  }

  FutureOr<void> _verificationSendHandler(_VerificationSend event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      verifyStatus: FormzSubmissionStatus.inProgress,
      successSendCode: false,
      phoneNumber: null,
      successVerifyCode: false,
      isNewPatient: null,
      registrationResponse: null,
    ));
    EasyLoading.show();
    final res = await _repository.registerUser(request: event.request);

    res.fold((error) async {
      LogService.e(" ----> error on bloc  : $error");
      EasyLoading.showError(error.message);
      emit(state.copyWith(
        verifyStatus: FormzSubmissionStatus.failure,
        successSendCode: false,
        errorSendCode: true,
      ));
    }, (data) async {
      EasyLoading.dismiss();

      if (data.multiUser) {
        emit(state.copyWith(
          verifyStatus: FormzSubmissionStatus.success,
          registrationResponse: data,
          successSendCode: true,
          phoneNumber: event.request.phoneNumber,
        ));
      } else {
        if (data.accessToken != null && data.refreshToken != null) {
          _dbService.setToken(Token(
            accessToken: data.accessToken!,
            refreshToken: data.refreshToken!,
            tokenType: data.tokenType ?? 'Bearer',
          ));
        }

        emit(state.copyWith(
          verifyStatus: FormzSubmissionStatus.success,
          successSendCode: true,
          successVerifyCode: true,
          phoneNumber: event.request.phoneNumber,
          isNewPatient: data.isNewPatient,
          registrationResponse: data,
        ));
      }
    });
  }

  FutureOr<void> _sendPhoneNumberHandler(_SendPhoneNumber event, Emitter<AuthState> emit) async {
    emit(state.copyWith(successSendCode: false, phoneNumber: null, successVerifyCode: false));
    EasyLoading.show();

    final res = await _repository.sendPhoneNumber(request: event.request);

    res.fold((error) async {
      LogService.e(" ----> error on phone number bloc: $error");
      EasyLoading.showError(error.message);
      emit(state.copyWith(successSendCode: false));
    }, (data) async {
      EasyLoading.dismiss();
      emit(state.copyWith(
        successSendCode: true,
        phoneNumber: event.request.phoneNumber,
      ));
    });
  }

  FutureOr<void> _sendUserInfoHandler(_SendUserInfo event, Emitter<AuthState> emit) async {
    final patient = event.request;
    final id = _dbService.getUid;
    final os = _dbService.getPlatform;
    final name = _dbService.getDeviceName;
    final version = _dbService.getVersion;

    final user = CreateInfoReq(
      (b) => b
        ..deviceId = id
        ..deviceName = name
        ..appVersion = version
        ..os = os.toLowerCase()
        ..firstName = patient.firstName
        ..lastName = patient.lastName
        ..middleName = patient.middleName
        ..phoneNumber = patient.phoneNumber
        ..gender = patient.gender
        ..offerta = patient.offerta
        ..dateOfBirth = patient.dateOfBirth
        ..passportSerial = patient.passportSerial,
    );

    /// id name os app version
    emit(state.copyWith(successSendCode: false));
    EasyLoading.show();

    final res = await _repository.sendUserInfo(request: user);

    res.fold((error) async {
      LogService.e(" ----> error on send user info bloc: $error");
      EasyLoading.showError(error.message);
      emit(state.copyWith(successSendCode: false));
    }, (data) async {
      EasyLoading.dismiss();
      emit(state.copyWith(successSendUserInfo: true));
    });
  }

  FutureOr<void> _fetchPatientInfoHandler(_FetchPatientInfo event, Emitter<AuthState> emit) async {
    _hasToken(emit);
    if (state.patientInfo != null) {
      return;
    }

    emit(state.copyWith(
      isFetchingPatientInfo: true,
      errorFetchingPatientInfo: false,
    ));

    final res = await _repository.getPatientInfo();

    res.fold(
      (error) {
        LogService.e(" ----> error fetching patient info: $error");
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: true,
        ));
      },
      (patientInfo) {
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: false,
          patientInfo: patientInfo,
        ));
      },
    );
  }

  FutureOr<void> _fetchPatientVisitsHandler(_FetchPatientVisits event, Emitter<AuthState> emit) async {
    emit(state.copyWith(fetchPatientVisitStatus: FormzSubmissionStatus.inProgress));

    final result = await _repository.getPatientVisits(time: event.time);

    result.fold(
      (failure) {
        LogService.e(" ----> error fetching patient visits: $failure");
        emit(state.copyWith(fetchPatientVisitStatus: FormzSubmissionStatus.failure));
      },
      (res) {
        emit(state.copyWith(
          fetchPatientVisitStatus: FormzSubmissionStatus.success,
          moves: res.orders?.toList() ?? [],
          visits: res.visits?.toList() ?? [],
        ));
      },
    );
  }

  FutureOr<void> _fetchPatientVisitsSingle(_FetchPatientVisitsDetail event, Emitter<AuthState> emit) async {
    emit(state.copyWith(fetchPatientVisitSingleStatus: FormzSubmissionStatus.inProgress));
    final result = await _repository.getPatientVisitSingle(id: event.id);
    result.fold(
      (failure) {
        LogService.e(" ----> error fetching patient visits: $failure");
        emit(state.copyWith(fetchPatientVisitSingleStatus: FormzSubmissionStatus.failure));
      },
      (single) {
        emit(state.copyWith(
          fetchPatientVisitSingleStatus: FormzSubmissionStatus.success,
          patientVisitSingle: single,
        ));
      },
    );
  }

  FutureOr<void> _cancelVisit(_CancelVisit event, Emitter<AuthState> emit) async {
    emit(state.copyWith(cancelVisitStatus: FormzSubmissionStatus.inProgress));
    final result = await _repository.cancelVisit(cancel: CancelVisitBody((v) => v..visitId = event.id));
    result.fold(
      (failure) {
        LogService.e(" ----> error fetching patient visits: $failure");
        emit(state.copyWith(cancelVisitStatus: FormzSubmissionStatus.failure));
      },
      (cancelResult) {
        emit(state.copyWith(
          cancelVisitStatus: FormzSubmissionStatus.success,
          cancelVisitResult: cancelResult,
        ));
      },
    );
  }

  FutureOr<void> _fetchPatientAnalyze(_FetchPatientAnalyze event, Emitter<AuthState> emit) async {
    emit(state.copyWith(fetchPatientAnalyseStatus: FormzSubmissionStatus.inProgress));

    final res = await _repository.getPatientAnalyze();

    res.fold(
      (error) {
        LogService.e(" ----> error fetching patient info: $error");
        emit(state.copyWith(fetchPatientAnalyseStatus: FormzSubmissionStatus.inProgress));
      },
      (patientAnalyze) {
        emit(state.copyWith(
          fetchPatientAnalyseStatus: FormzSubmissionStatus.success,
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: false,
          patientAnalyze: patientAnalyze,
        ));
      },
    );
  }

  FutureOr<void> _fetchRecipes(_FetchRecipes event, Emitter<AuthState> emit) async {
    emit(state.copyWith(fetchRecipeStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.getRecipes();
    res.fold(
      (failure) {
        emit(state.copyWith(fetchRecipeStatus: FormzSubmissionStatus.failure));
      },
      (recipes) {
        debugPrint("*********************");
        debugPrint(" length: ${recipes.length}");
        debugPrint("*********************");
        emit(state.copyWith(
          recipes: recipes,
          fetchRecipeStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _fetchRecommendation(_FetchRecommendation event, Emitter<AuthState> emit) async {
    emit(state.copyWith(fetchRecommendationStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.getRecommendation();
    res.fold(
      (failure) {
        emit(state.copyWith(fetchRecommendationStatus: FormzSubmissionStatus.failure));
      },
      (recommendation) {
        emit(state.copyWith(
          recommendation: recommendation,
          fetchRecommendationStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _fetchMyWallet(_FetchMyWallet event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isFetchingPatientInfo: true,
      errorFetchingPatientInfo: false,
    ));

    final res = await _repository.getMyWallet();

    res.fold(
      (error) {
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: true,
          myWallet: null,
        ));
      },
      (myWallet) {
        LogService.i("Successfully fetched wallet data");
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: false,
          myWallet: myWallet,
        ));
      },
    );
  }
}
