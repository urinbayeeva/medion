part of 'home_bloc.dart';


@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<News> news,
    
  }) = _HomeState;
}
