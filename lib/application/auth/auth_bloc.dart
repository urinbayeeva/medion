import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/presentation/component/easy_loading.dart';

import '../../domain/models/auth/auth.dart';
import '../../infrastructure/services/log_service.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(
    this._repository,
  ) : super(const _AuthState()) {
    on<_CheckAuth>(_checkAuth);
    on<_VerificationSend>(_verificationSendHandler);
    on<_VerificationVerify>(_verificationVerifyHandler);
    on<_SignIn>(_signInHandler);
    on<_UpdatePassword>(_updatePasswordHandler);
    on<_UpdatePhone>(_updatePhoneHandler);
    on<_AdditionalNumberVerify>(_additionalNumberVerify);
    on<_ForgotPassword>(_forgotPasswordHandler);
  }

  /// Authentication Check
  Future<void> _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    final res = _repository.checkUser();

    res.fold(
      () {
        return emit(state.copyWith(proceedToHome: true));
      },
      (error) {
        return emit(state.copyWith(proceedToHome: false));
      },
    );
  }

  FutureOr<void> _verificationSendHandler(
    _VerificationSend event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
        successSendCode: false, phoneNumber: null, successVerifyCode: false));
    EasyLoading.show();
    final res = await _repository.verificationSend(request: event.request);

    res.fold((error) async {
      LogService.e(" ----> error on bloc  : $error");
      EasyLoading.showError(error.message);
      emit(state.copyWith(successSendCode: false));
    }, (data) async {
      EasyLoading.dismiss();
      emit(state.copyWith(
          successSendCode: true, phoneNumber: event.request.phone));
    });
  }

  FutureOr<void> _verificationVerifyHandler(
    _VerificationVerify event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(successVerifyCode: false));
    EasyLoading.show();
    final res = await _repository.verificationVerify(request: event.request);

    res.fold((error) async {
      EasyLoading.showError(error.message);
      emit(state.copyWith(successVerifyCode: false));
      LogService.e(" ----> error on bloc  : $error");
    }, (data) async {
      emit(state.copyWith(successVerifyCode: true));
    });
    EasyLoading.dismiss();
  }

  FutureOr<void> _additionalNumberVerify(
    _AdditionalNumberVerify event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(successVerifyCode: false, successSendCode: false));
    EasyLoading.show();
    final res =
        await _repository.additionalNumberVerify(request: event.request);

    res.fold((error) async {
      emit(state.copyWith(successVerifyCode: false));
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on bloc  : $error");
    }, (data) async {
      emit(state.copyWith(successVerifyCode: true));
    });
    EasyLoading.dismiss();
  }

  FutureOr<void> _signInHandler(
    _SignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(proceedToHome: false));
    EasyLoading.show();
    final res = await _repository.signIn(request: event.request);
    res.fold((error) async {
      emit(state.copyWith(proceedToHome: false));
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on bloc  : $error");
    }, (data) async {
      EasyLoading.dismiss();
      return emit(state.copyWith(proceedToHome: true));
    });
  }

  FutureOr<void> _forgotPasswordHandler(
    _ForgotPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(successVerifyCode: false));
    EasyLoading.show();
    final res = await _repository.forgotPassword(request: event.request);

    res.fold((error) async {
      emit(state.copyWith(successVerifyCode: false));
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on bloc  : ${error.message}");
    }, (data) async {
      emit(state.copyWith(successVerifyCode: true));
      EasyLoading.showSuccess(data.detail ?? "");
    });
    EasyLoading.dismiss();
  }

  FutureOr<void> _updatePasswordHandler(
    _UpdatePassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(proceedToHome: false));
    EasyLoading.show();
    final res = await _repository.updatePassword(request: event.request);

    res.fold((error) async {
      emit(state.copyWith(proceedToHome: false));
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on bloc  : ${error.message}");
    }, (data) async {
      emit(state.copyWith(proceedToHome: true));
      EasyLoading.showSuccess(data.detail ?? "");
    });
    EasyLoading.dismiss();
  }

  FutureOr<void> _updatePhoneHandler(
    _UpdatePhone event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(successUpdatePhone: false, errorSendCode: false));
    EasyLoading.show();
    final res = await _repository.updatePhone(request: event.request);

    res.fold((error) async {
      emit(state.copyWith(successUpdatePhone: false, errorSendCode: true));
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on bloc  : $error");
    }, (data) async {
      emit(state.copyWith(successUpdatePhone: true));
      EasyLoading.showSuccess(data.detail);
    });
    EasyLoading.dismiss();
  }
}
