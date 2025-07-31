part of 'content_bloc.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.fetchContent({required String type}) = _FetchContent;

  const factory ContentEvent.getTeams({required String type}) = _GetTeams;

  const factory ContentEvent.getSingleContent({
    required int id,
    required String type,
  }) = _GetSingleContent;

// const factory ContentEvent.getDiscountSingle({required int id}) = _GetSingleDiscount;
}
