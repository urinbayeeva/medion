// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_services.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MedicalServices> _$medicalServicesSerializer =
    new _$MedicalServicesSerializer();
Serializer<DiseaseModle> _$diseaseModleSerializer =
    new _$DiseaseModleSerializer();
Serializer<AdModel> _$adModelSerializer = new _$AdModelSerializer();

class _$MedicalServicesSerializer
    implements StructuredSerializer<MedicalServices> {
  @override
  final Iterable<Type> types = const [MedicalServices, _$MedicalServices];
  @override
  final String wireName = 'MedicalServices';

  @override
  Iterable<Object?> serialize(Serializers serializers, MedicalServices object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forChildren;
    if (value != null) {
      result
        ..add('for_children')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.backgroundColor;
    if (value != null) {
      result
        ..add('background_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MedicalServices deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicalServicesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'for_children':
          result.forChildren = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'background_color':
          result.backgroundColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DiseaseModleSerializer implements StructuredSerializer<DiseaseModle> {
  @override
  final Iterable<Type> types = const [DiseaseModle, _$DiseaseModle];
  @override
  final String wireName = 'DiseaseModle';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiseaseModle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forChildren;
    if (value != null) {
      result
        ..add('for_children')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DiseaseModle deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiseaseModleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'for_children':
          result.forChildren = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$AdModelSerializer implements StructuredSerializer<AdModel> {
  @override
  final Iterable<Type> types = const [AdModel, _$AdModel];
  @override
  final String wireName = 'AdModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.important;
    if (value != null) {
      result
        ..add('important')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  AdModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'important':
          result.important = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$MedicalServices extends MedicalServices {
  @override
  final String? title;
  @override
  final String? info;
  @override
  final bool? forChildren;
  @override
  final JsonObject? link;
  @override
  final String? backgroundColor;
  @override
  final String? image;

  factory _$MedicalServices([void Function(MedicalServicesBuilder)? updates]) =>
      (new MedicalServicesBuilder()..update(updates))._build();

  _$MedicalServices._(
      {this.title,
      this.info,
      this.forChildren,
      this.link,
      this.backgroundColor,
      this.image})
      : super._();

  @override
  MedicalServices rebuild(void Function(MedicalServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicalServicesBuilder toBuilder() =>
      new MedicalServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalServices &&
        title == other.title &&
        info == other.info &&
        forChildren == other.forChildren &&
        link == other.link &&
        backgroundColor == other.backgroundColor &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, forChildren.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicalServices')
          ..add('title', title)
          ..add('info', info)
          ..add('forChildren', forChildren)
          ..add('link', link)
          ..add('backgroundColor', backgroundColor)
          ..add('image', image))
        .toString();
  }
}

class MedicalServicesBuilder
    implements Builder<MedicalServices, MedicalServicesBuilder> {
  _$MedicalServices? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

  bool? _forChildren;
  bool? get forChildren => _$this._forChildren;
  set forChildren(bool? forChildren) => _$this._forChildren = forChildren;

  JsonObject? _link;
  JsonObject? get link => _$this._link;
  set link(JsonObject? link) => _$this._link = link;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(String? backgroundColor) =>
      _$this._backgroundColor = backgroundColor;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  MedicalServicesBuilder();

  MedicalServicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _info = $v.info;
      _forChildren = $v.forChildren;
      _link = $v.link;
      _backgroundColor = $v.backgroundColor;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedicalServices;
  }

  @override
  void update(void Function(MedicalServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicalServices build() => _build();

  _$MedicalServices _build() {
    final _$result = _$v ??
        new _$MedicalServices._(
          title: title,
          info: info,
          forChildren: forChildren,
          link: link,
          backgroundColor: backgroundColor,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

class _$DiseaseModle extends DiseaseModle {
  @override
  final String? title;
  @override
  final String? icon;
  @override
  final bool? forChildren;
  @override
  final bool? link;

  factory _$DiseaseModle([void Function(DiseaseModleBuilder)? updates]) =>
      (new DiseaseModleBuilder()..update(updates))._build();

  _$DiseaseModle._({this.title, this.icon, this.forChildren, this.link})
      : super._();

  @override
  DiseaseModle rebuild(void Function(DiseaseModleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiseaseModleBuilder toBuilder() => new DiseaseModleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiseaseModle &&
        title == other.title &&
        icon == other.icon &&
        forChildren == other.forChildren &&
        link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, forChildren.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiseaseModle')
          ..add('title', title)
          ..add('icon', icon)
          ..add('forChildren', forChildren)
          ..add('link', link))
        .toString();
  }
}

class DiseaseModleBuilder
    implements Builder<DiseaseModle, DiseaseModleBuilder> {
  _$DiseaseModle? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  bool? _forChildren;
  bool? get forChildren => _$this._forChildren;
  set forChildren(bool? forChildren) => _$this._forChildren = forChildren;

  bool? _link;
  bool? get link => _$this._link;
  set link(bool? link) => _$this._link = link;

  DiseaseModleBuilder();

  DiseaseModleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _icon = $v.icon;
      _forChildren = $v.forChildren;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiseaseModle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiseaseModle;
  }

  @override
  void update(void Function(DiseaseModleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiseaseModle build() => _build();

  _$DiseaseModle _build() {
    final _$result = _$v ??
        new _$DiseaseModle._(
          title: title,
          icon: icon,
          forChildren: forChildren,
          link: link,
        );
    replace(_$result);
    return _$result;
  }
}

class _$AdModel extends AdModel {
  @override
  final String? title;
  @override
  final String? info;
  @override
  final String? image;
  @override
  final bool? important;
  @override
  final bool? link;

  factory _$AdModel([void Function(AdModelBuilder)? updates]) =>
      (new AdModelBuilder()..update(updates))._build();

  _$AdModel._({this.title, this.info, this.image, this.important, this.link})
      : super._();

  @override
  AdModel rebuild(void Function(AdModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdModelBuilder toBuilder() => new AdModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdModel &&
        title == other.title &&
        info == other.info &&
        image == other.image &&
        important == other.important &&
        link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, important.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdModel')
          ..add('title', title)
          ..add('info', info)
          ..add('image', image)
          ..add('important', important)
          ..add('link', link))
        .toString();
  }
}

class AdModelBuilder implements Builder<AdModel, AdModelBuilder> {
  _$AdModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  bool? _important;
  bool? get important => _$this._important;
  set important(bool? important) => _$this._important = important;

  bool? _link;
  bool? get link => _$this._link;
  set link(bool? link) => _$this._link = link;

  AdModelBuilder();

  AdModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _info = $v.info;
      _image = $v.image;
      _important = $v.important;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdModel;
  }

  @override
  void update(void Function(AdModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdModel build() => _build();

  _$AdModel _build() {
    final _$result = _$v ??
        new _$AdModel._(
          title: title,
          info: info,
          image: image,
          important: important,
          link: link,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
