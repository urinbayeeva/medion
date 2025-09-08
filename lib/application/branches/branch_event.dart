part of 'branch_bloc.dart';

@freezed
abstract class BranchEvent with _$BranchEvent {
  const factory BranchEvent.fetchBranches() = _FetchBranches;

  const factory BranchEvent.getReviews({
    @Default(<ReviewInfoModel>[]) List<ReviewInfoModel> directions,
    @Default(<ReviewInfoModel>[]) List<ReviewInfoModel> branches,
    @Default([]) intervals,
    @Default(-1) int rank,
    String? startDate,
    String? endDate,
  }) = _GetReviews;

  const factory BranchEvent.fetchAwards() = _FetchAwards;

  const factory BranchEvent.fetchStudy() = _FetchStudy;

  const factory BranchEvent.studyLead({required StudyLead report}) = _StudyLead;

  const factory BranchEvent.fetchOfferta() = _FetchOfferta;

  const factory BranchEvent.fetchActivity() = _FetchActivity;

  const factory BranchEvent.postReviews({required PostReviewModel review}) = _PostReviews;

  const factory BranchEvent.getBranchDetail({required int id}) = _GetBranchDetail;

  const factory BranchEvent.fillingReviewData({
    @Default(-1) int rank,
    @Default(-1) int id,
    @Default('') String branch,
    @Default('') String comment,
  }) = _FillingReviewData;
}
