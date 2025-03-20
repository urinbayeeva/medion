part of 'content_bloc.dart';

@freezed
class ContentState with _$ContentState {
  const ContentState._();

  const factory ContentState({
    @Default(<String, List<ContentModel>>{})
    Map<String, List<ContentModel>> contentByType,
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<ContentModel> content,
  }) = _ContentState;
}
