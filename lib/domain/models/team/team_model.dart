import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'team_model.g.dart';

abstract class Team implements Built<Team, TeamBuilder> {
  String get name;

  String get type;

  String get job;

  String get image;

  Team._();

  factory Team([void Function(TeamBuilder) updates]) = _$Team;

  // Serializatsiya uchun
  static Serializer<Team> get serializer => _$teamSerializer;
}
