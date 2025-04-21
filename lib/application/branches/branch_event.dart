part of 'branch_bloc.dart';

@freezed
abstract class BranchEvent with _$BranchEvent {
  const factory BranchEvent.fetchBranches() = _FetchBranches;
  const factory BranchEvent.fetchAwards() = _FetchAwards;
  const factory BranchEvent.fetchStudy() = _FetchStudy;
  const factory BranchEvent.fetchOfferta() = _FetchOfferta;
}
