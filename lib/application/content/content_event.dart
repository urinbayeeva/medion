part of 'content_bloc.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.fetchContent({required String type}) = _FetchContent;

  const factory ContentEvent.getTeams({required String type}) = _GetTeams;
}
