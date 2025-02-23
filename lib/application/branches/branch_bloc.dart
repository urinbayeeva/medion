import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/repository/branch_repo.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'branch_bloc.freezed.dart';
part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepository _repository;

  BranchBloc(this._repository) : super(const BranchState()) {
    on<_FetchBranches>(_fetchBranches);
  }

  FutureOr<void> _fetchBranches(
    _FetchBranches event,
    Emitter<BranchState> emit,
  ) async {
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
}
