import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';

import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

import '../../domain/models/auth/auth.dart';
import '../../infrastructure/services/log_service.dart';

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
    on<_CheckAuth>(_checkAuth);
    on<_VerificationSend>(_verificationSendHandler);
    on<_SendPhoneNumber>(_sendPhoneNumberHandler);
    on<_SendUserInfo>(_sendUserInfoHandler);
    on<_FetchPatientInfo>(_fetchPatientInfoHandler);
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

  /// Handle verification send request
  FutureOr<void> _verificationSendHandler(
    _VerificationSend event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
        successSendCode: false, phoneNumber: null, successVerifyCode: false));
    EasyLoading.show();
    final res = await _repository.registerUser(request: event.request);

    res.fold((error) async {
      LogService.e(" ----> error on bloc  : $error");
      // EasyLoading.showError(error.message);
      emit(state.copyWith(successSendCode: false));
    }, (data) async {
      EasyLoading.dismiss();
      emit(state.copyWith(
          successSendCode: true, phoneNumber: event.request.phoneNumber));
    });
  }

  FutureOr<void> _sendPhoneNumberHandler(
    _SendPhoneNumber event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
        successSendCode: false, phoneNumber: null, successVerifyCode: false));
    EasyLoading.show();

    final res = await _repository.sendPhoneNumber(request: event.request);

    res.fold((error) async {
      LogService.e(" ----> error on phone number bloc: $error");
      EasyLoading.showError(error.message); // Show error message
      emit(state.copyWith(successSendCode: false)); // Update state
    }, (data) async {
      EasyLoading.dismiss(); // Dismiss loading indicator
      emit(state.copyWith(
          successSendCode: true, phoneNumber: event.request.phoneNumber));
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
      emit(state.copyWith(successSendCode: true));
    });
  }

  /// Fetch patient information
  FutureOr<void> _fetchPatientInfoHandler(
    _FetchPatientInfo event,
    Emitter<AuthState> emit,
  ) async {
    final token = _dbService.token.accessToken;

    if (token == null || token.isEmpty) {
      emit(state.copyWith(
        isFetchingPatientInfo: false,
        errorFetchingPatientInfo: true,
      ));
      LogService.e("Token not found");
      return;
    }

    emit(state.copyWith(
        isFetchingPatientInfo: true, errorFetchingPatientInfo: false));

    final res = await _repository.getPatientInfo(accessToken: token);

    // Handle the result
    res.fold(
      (error) {
        LogService.e(" ----> error fetching patient info: $error");
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: true,
        ));
      },
      (patientInfo) {
        // Update the state with the fetched patient info
        emit(state.copyWith(
          isFetchingPatientInfo: false,
          errorFetchingPatientInfo: false,
          patientInfo: patientInfo,
        ));
      },
    );
  }
}
