part of 'visit_bloc.dart';

@freezed
class VisitState with _$VisitState {
  const VisitState._();

  const factory VisitState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus createVisitStatus,
    CreateVisitResponse? visits,
    @Default('') String errorMessage,
  }) = _VisitState;

  bool get hasError => errorMessage.isNotEmpty;
}
