part of 'branch_bloc.dart';

@freezed
abstract class BranchEvent with _$BranchEvent {
  const factory BranchEvent.fetchBranches() = _FetchBranches;
}
