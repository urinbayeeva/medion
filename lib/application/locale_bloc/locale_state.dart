part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus localeStatus,
    @Default(false) bool bannerIsAvailable,
  }) = _LocaleState;
}
