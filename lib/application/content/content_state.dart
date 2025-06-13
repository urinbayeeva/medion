part of 'content_bloc.dart';

@freezed
class ContentState with _$ContentState {
  const ContentState._();

  const factory ContentState({
    @Default(<String, List<ContentModel>>{}) Map<String, List<ContentModel>> contentByType,
    @Default(<String, Team>{}) Map<String, Team> team,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus teamStatus,
    // @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus activityStatus,
    // @Default() MedionModel medionModel,
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<ContentModel> content,
  }) = _ContentState;
}
