part of 'content_bloc.dart';

@freezed
abstract class ContentEvent with _$ContentEvent {
  const factory ContentEvent.fetchContent({required String type}) = _FetchContent;
}