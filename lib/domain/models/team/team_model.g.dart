// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Team> _$teamSerializer = new _$TeamSerializer();

class _$TeamSerializer implements StructuredSerializer<Team> {
  @override
  final Iterable<Type> types = const [Team, _$Team];
  @override
  final String wireName = 'Team';

  @override
  Iterable<Object?> serialize(Serializers serializers, Team object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'job',
      serializers.serialize(object.job, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Team deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeamBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'job':
          result.job = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Team extends Team {
  @override
  final String name;
  @override
  final String type;
  @override
  final String job;
  @override
  final String image;

  factory _$Team([void Function(TeamBuilder)? updates]) =>
      (new TeamBuilder()..update(updates))._build();

  _$Team._(
      {required this.name,
      required this.type,
      required this.job,
      required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Team', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'Team', 'type');
    BuiltValueNullFieldError.checkNotNull(job, r'Team', 'job');
    BuiltValueNullFieldError.checkNotNull(image, r'Team', 'image');
  }

  @override
  Team rebuild(void Function(TeamBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeamBuilder toBuilder() => new TeamBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Team &&
        name == other.name &&
        type == other.type &&
        job == other.job &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, job.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Team')
          ..add('name', name)
          ..add('type', type)
          ..add('job', job)
          ..add('image', image))
        .toString();
  }
}

class TeamBuilder implements Builder<Team, TeamBuilder> {
  _$Team? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _job;
  String? get job => _$this._job;
  set job(String? job) => _$this._job = job;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  TeamBuilder();

  TeamBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _job = $v.job;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Team other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Team;
  }

  @override
  void update(void Function(TeamBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Team build() => _build();

  _$Team _build() {
    final _$result = _$v ??
        new _$Team._(
          name: BuiltValueNullFieldError.checkNotNull(name, r'Team', 'name'),
          type: BuiltValueNullFieldError.checkNotNull(type, r'Team', 'type'),
          job: BuiltValueNullFieldError.checkNotNull(job, r'Team', 'job'),
          image: BuiltValueNullFieldError.checkNotNull(image, r'Team', 'image'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
