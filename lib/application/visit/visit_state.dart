part of 'visit_bloc.dart';

@freezed
class VisitState with _$VisitState {
  const VisitState._();

  const factory VisitState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<VisitOrder> visits,
    @Default('') String errorMessage,
  }) = _VisitState;

  bool get hasError => errorMessage.isNotEmpty;
}
