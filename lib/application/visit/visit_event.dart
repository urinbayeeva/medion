part of 'visit_bloc.dart';

@freezed
abstract class VisitEvent with _$VisitEvent {
  const factory VisitEvent.createVisit({required VisitRequest request}) = _CreateVisit;
}
