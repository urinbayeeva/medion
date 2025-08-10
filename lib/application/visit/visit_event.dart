part of 'visit_bloc.dart';

@freezed
abstract class VisitEvent with _$VisitEvent {
  const factory VisitEvent.createVisit({required List<VisitRequest> request}) = _CreateVisit;
}
