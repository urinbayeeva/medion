import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/repository/branch_repo.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'branch_bloc.freezed.dart';

part 'branch_event.dart';

part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepository _repository;

  BranchBloc(this._repository) : super(const BranchState()) {
    on<_FetchBranches>(_fetchBranches);
    on<_FetchAwards>(_fetchAwards);
    on<_FetchStudy>(_fetchStudy);
    on<_StudyLead>(_leadStudy);
    on<_FetchOfferta>(_fetchOfferta);
    on<_FetchActivity>(_fetchActivity);
    on<_GetBranchDetail>(_getBranchDetail);
    on<_GetReviews>(_getReview);
    on<_PostReviews>(_postReview);
    on<_FillingReviewData>(_filling);
  }

  FutureOr<void> _filling(_FillingReviewData event, Emitter<BranchState> emit) async {
    if (event.rank != -1) {
      emit(state.copyWith(reviewRank: event.rank));
    }
    if (event.comment.isNotEmpty) {
      emit(state.copyWith(reviewComment: event.comment));
    }
    if (event.branch.isNotEmpty) {
      emit(state.copyWith(reviewBranch: event.branch));
    }
    if (event.id > 0) {
      emit(state.copyWith(branchId: event.id));
    }
    if (event.rank == 99) {
      emit(state.copyWith(reviewRank: -4, reviewBranch: event.branch, reviewComment: event.comment, branchId: 0));
    }
  }

  FutureOr<void> _getReview(_GetReviews event, Emitter<BranchState> emit) async {
    emit(state.copyWith(getReviewStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.getReview();

    res.fold(
      (failure) {
        emit(state.copyWith(getReviewStatus: FormzSubmissionStatus.failure));
      },
      (res) {
        emit(state.copyWith(
          reviews: res,
          getReviewStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _postReview(_PostReviews event, Emitter<BranchState> emit) async {
    emit(state.copyWith(postReviewStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.postReview(review: event.review);

    res.fold(
      (failure) {
        emit(state.copyWith(postReviewStatus: FormzSubmissionStatus.failure));
      },
      (res) {
        emit(state.copyWith(
          postReviewStatus: FormzSubmissionStatus.success,
        ));
      },
    );
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
    emit(state.copyWith(getBranchesStatus: FormzSubmissionStatus.inProgress));

    final res = await _repository.fetchBranches();
    res.fold(
      (error) {
        LogService.e("Error in fetching branches: $error");
        emit(state.copyWith(getBranchesStatus: FormzSubmissionStatus.inProgress));
      },
      (data) {
        emit(state.copyWith(
          getBranchesStatus: FormzSubmissionStatus.success,
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
        LogService.e("Error in _fetchAwards: $error");
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
        LogService.e("Error in _fetchStudy: $error");
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

  FutureOr<void> _leadStudy(_StudyLead event, Emitter<BranchState> emit) async {
    emit(state.copyWith(studyLeadStatus: FormzSubmissionStatus.inProgress));
    EasyLoading.show();

    final res = await _repository.studyLead(report: event.report);
    res.fold(
      (error) {
        emit(state.copyWith(studyLeadStatus: FormzSubmissionStatus.failure));
        LogService.e("Error in study lead: $error");
        EasyLoading.showError(error.message);
      },
      (data) {
        emit(state.copyWith(studyLeadStatus: FormzSubmissionStatus.success));
        EasyLoading.dismiss();
      },
    );
  }

  FutureOr<void> _fetchOfferta(_FetchOfferta event, Emitter<BranchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    EasyLoading.show();

    final res = await _repository.getOfferta();
    res.fold(
      (error) {
        LogService.e("Error in _fetchOfferta: $error");
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
