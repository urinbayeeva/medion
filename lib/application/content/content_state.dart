part of 'content_bloc.dart';

@freezed
class ContentState with _$ContentState {
  const ContentState._();

  const factory ContentState({
    @Default(<String, List<ContentModel>>{}) Map<String, List<ContentModel>> contentByType,
    @Default(<Team>[]) List<Team> team,
    @Default(<String>[]) List<String> jobTypes,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus teamStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus activityStatus,
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<ContentModel> content,
    MedionModel? medionModel,
  }) = _ContentState;
}
