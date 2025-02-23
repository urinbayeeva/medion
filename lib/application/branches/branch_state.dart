part of 'branch_bloc.dart';

@freezed
class BranchState with _$BranchState {
  const BranchState._();

  const factory BranchState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<BranchModel> branches,
  }) = _BranchState;
}
