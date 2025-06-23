part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.started() = _Started;

  const factory LocaleEvent.update({Set<String>? updatedKeys}) = _Update;

  const factory LocaleEvent.initialize() = _Initialize;
}
