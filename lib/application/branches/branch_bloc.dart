import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/repository/branch_repo.dart';
import 'package:medion/infrastructure/repository/company_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'branch_bloc.freezed.dart';

part 'branch_event.dart';

part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepository _repository;

  BranchBloc(this._repository) : super(const BranchState()) {
    on<_FetchBranches>(_fetchBranches);
    on<_FetchAwards>(_fetchAwards);
    on<_FetchStudy>(_fetchStudy);
    on<_FetchOfferta>(_fetchOfferta);
    on<_FetchActivity>(_fetchActivity);
    on<_GetBranchDetail>(_getBranchDetail);
  }

  FutureOr<void> _getBranchDetail(_GetBranchDetail event, Emitter<BranchState> emit) async {
    emit(state.copyWith(branchDetailStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.getBranchDetail(id: event.id);

    res.fold(
      (failure) {
        emit(state.copyWith(branchDetailStatus: FormzSubmissionStatus.failure));
      },
      (success) {
        emit(state.copyWith(
          branchDetailStatus: FormzSubmissionStatus.success,
          branchDetail: success,
        ));
      },
    );
  }

  FutureOr<void> _fetchActivity(_FetchActivity event, Emitter<BranchState> emit) async {
    emit(state.copyWith(activityStatus: FormzSubmissionStatus.initial));

    final response = await _repository.getMedionActivity();
    response.fold(
      (failure) {
        emit(state.copyWith(activityStatus: FormzSubmissionStatus.failure));
      },
      (activity) {
        emit(state.copyWith(activityStatus: FormzSubmissionStatus.success, medionActivity: activity));
      },
    );
  }

  FutureOr<void> _fetchBranches(_FetchBranches event, Emitter<BranchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    EasyLoading.show();

    final res = await _repository.fetchBranches();
    res.fold(
      (error) {
        LogService.e("Error in fetching branches: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          branches: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchAwards(_FetchAwards event, Emitter<BranchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    EasyLoading.show();

    final res = await _repository.fetchAwards();
    res.fold(
      (error) {
        LogService.e("Error in fetching branches: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          awards: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchStudy(_FetchStudy event, Emitter<BranchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    EasyLoading.show();

    final res = await _repository.fetchStudy();
    res.fold(
      (error) {
        LogService.e("Error in fetching branches: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          study: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchOfferta(_FetchOfferta event, Emitter<BranchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    EasyLoading.show();

    final res = await _repository.getOfferta();
    res.fold(
      (error) {
        LogService.e("Error in fetching branches: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          offerta: data,
        ));
      },
    );
  }
}
