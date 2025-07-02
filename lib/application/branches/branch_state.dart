part of 'branch_bloc.dart';

@freezed
class BranchState with _$BranchState {
  const BranchState._();

  const factory BranchState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default('') String reviewBranch,
    @Default('') String reviewComment,
    @Default(-1) int reviewRank,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus activityStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus branchDetailStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getReviewStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus postReviewStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getBranchesStatus,
    @Default([]) List<GetReviewModel> reviews,
    @Default([]) List<BranchModel> branches,
    @Default([]) List<AwardsModel> awards,
    @Default(null) EducationModel? study,
    @Default(null) BranchDetailModel? branchDetail,
    @Default(null) OfferModel? offerta,
    @Default(null) MedionModel? medionActivity,
  }) = _BranchState;
}
