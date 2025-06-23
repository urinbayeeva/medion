import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/enums/user_status_enum.dart';

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
    on<_FetchPatientAnalyze>(_fetchPatientAnalyze);
    on<_FetchMyWallet>(_fetchMyWallet);
    on<_CheckAuth>(_checkAuth);
  }

  FutureOr<void> _hasToken(Emitter<AuthState> emit) async {
    final token = _dbService.token;
    final access = token.accessToken;
    final refresh = token.refreshToken;
    if (access != null && access.isNotEmpty || refresh != null && refresh.isNotEmpty) {
      emit(state.copyWith(haveToken: true));
    } else {
      emit(state.copyWith(haveToken: false));
    }
  }

  FutureOr<void> _setFirebaseToken() async {
    final newFcm = await FirebaseMessaging.instance.getToken();
    final fcm = _dbService.getFcmToken;

    if (fcm != newFcm && newFcm != null && newFcm.length > 5) {
      _dbService.setFcmToken(newFcm ?? '');
      //  send back this token
    }
  }

  FutureOr<void> _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
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
    _hasToken(emit);
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

  FutureOr<void> _sendUserInfoHandler(
    _SendUserInfo event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(successSendCode: false));
    EasyLoading.show();

    final res = await _repository.sendUserInfo(request: event.request);

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
    _setFirebaseToken();
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

  FutureOr<void> _fetchPatientVisitsHandler(
    _FetchPatientVisits event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoadingVisits: true, errorFetchingVisits: false));

    final result = await _repository.getPatientVisits();

    result.fold(
      (failure) {
        LogService.e(" ----> error fetching patient visits: $failure");
        emit(state.copyWith(
          isLoadingVisits: false,
          errorFetchingVisits: true,
        ));
      },
      (visits) {
        emit(state.copyWith(
          isLoadingVisits: false,
          errorFetchingVisits: false,
          patientVisits: visits,
        ));
      },
    );
  }

  FutureOr<void> _fetchPatientAnalyze(
    _FetchPatientAnalyze event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith());

    final res = await _repository.getPatientAnalyze();

    res.fold(
      (error) {
        LogService.e(" ----> error fetching patient info: $error");
        emit(state.copyWith());
      },
      (patientAnalyze) {
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: false,
          patientAnalyze: patientAnalyze,
        ));
      },
    );
  }

  FutureOr<void> _fetchMyWallet(
    _FetchMyWallet event,
    Emitter<AuthState> emit,
  ) async {
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
