part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<MedionResponseSearchText> results,
    @Default([]) List<SearchButtonFields> buttons,
  }) = _SearchState;
}
