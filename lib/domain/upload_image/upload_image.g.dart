// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PreSignedUrlReq> _$preSignedUrlReqSerializer =
    new _$PreSignedUrlReqSerializer();
Serializer<PreSignedUrlRes> _$preSignedUrlResSerializer =
    new _$PreSignedUrlResSerializer();
Serializer<Fields> _$fieldsSerializer = new _$FieldsSerializer();
Serializer<ImageUploadResponseModel> _$imageUploadResponseModelSerializer =
    new _$ImageUploadResponseModelSerializer();
Serializer<Urls> _$urlsSerializer = new _$UrlsSerializer();

class _$PreSignedUrlReqSerializer
    implements StructuredSerializer<PreSignedUrlReq> {
  @override
  final Iterable<Type> types = const [PreSignedUrlReq, _$PreSignedUrlReq];
  @override
  final String wireName = 'PreSignedUrlReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, PreSignedUrlReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.fileName;
    if (value != null) {
      result
        ..add('file_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contentType;
    if (value != null) {
      result
        ..add('content_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PreSignedUrlReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PreSignedUrlReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'file_name':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content_type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PreSignedUrlResSerializer
    implements StructuredSerializer<PreSignedUrlRes> {
  @override
  final Iterable<Type> types = const [PreSignedUrlRes, _$PreSignedUrlRes];
  @override
  final String wireName = 'PreSignedUrlRes';

  @override
  Iterable<Object?> serialize(Serializers serializers, PreSignedUrlRes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fields;
    if (value != null) {
      result
        ..add('fields')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Fields)));
    }
    value = object.fileName;
    if (value != null) {
      result
        ..add('file_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PreSignedUrlRes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PreSignedUrlResBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(Fields))! as Fields);
          break;
        case 'file_name':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FieldsSerializer implements StructuredSerializer<Fields> {
  @override
  final Iterable<Type> types = const [Fields, _$Fields];
  @override
  final String wireName = 'Fields';

  @override
  Iterable<Object?> serialize(Serializers serializers, Fields object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contentType;
    if (value != null) {
      result
        ..add('Content-Type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aWSAccessKeyId;
    if (value != null) {
      result
        ..add('AWSAccessKeyId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzCredential;
    if (value != null) {
      result
        ..add('x-amz-credential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzDate;
    if (value != null) {
      result
        ..add('x-amz-date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.policy;
    if (value != null) {
      result
        ..add('policy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature;
    if (value != null) {
      result
        ..add('signature')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Fields deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Content-Type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'AWSAccessKeyId':
          result.aWSAccessKeyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-credential':
          result.xAmzCredential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-date':
          result.xAmzDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'policy':
          result.policy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageUploadResponseModelSerializer
    implements StructuredSerializer<ImageUploadResponseModel> {
  @override
  final Iterable<Type> types = const [
    ImageUploadResponseModel,
    _$ImageUploadResponseModel
  ];
  @override
  final String wireName = 'ImageUploadResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ImageUploadResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.urls;
    if (value != null) {
      result
        ..add('urls')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Urls)));
    }
    return result;
  }

  @override
  ImageUploadResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageUploadResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'urls':
          result.urls.replace(serializers.deserialize(value,
              specifiedType: const FullType(Urls))! as Urls);
          break;
      }
    }

    return result.build();
  }
}

class _$UrlsSerializer implements StructuredSerializer<Urls> {
  @override
  final Iterable<Type> types = const [Urls, _$Urls];
  @override
  final String wireName = 'Urls';

  @override
  Iterable<Object?> serialize(Serializers serializers, Urls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.original;
    if (value != null) {
      result
        ..add('original')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Urls deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'original':
          result.original = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PreSignedUrlReq extends PreSignedUrlReq {
  @override
  final String? fileName;
  @override
  final String? contentType;

  factory _$PreSignedUrlReq([void Function(PreSignedUrlReqBuilder)? updates]) =>
      (new PreSignedUrlReqBuilder()..update(updates))._build();

  _$PreSignedUrlReq._({this.fileName, this.contentType}) : super._();

  @override
  PreSignedUrlReq rebuild(void Function(PreSignedUrlReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreSignedUrlReqBuilder toBuilder() =>
      new PreSignedUrlReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreSignedUrlReq &&
        fileName == other.fileName &&
        contentType == other.contentType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreSignedUrlReq')
          ..add('fileName', fileName)
          ..add('contentType', contentType))
        .toString();
  }
}

class PreSignedUrlReqBuilder
    implements Builder<PreSignedUrlReq, PreSignedUrlReqBuilder> {
  _$PreSignedUrlReq? _$v;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _contentType;
  String? get contentType => _$this._contentType;
  set contentType(String? contentType) => _$this._contentType = contentType;

  PreSignedUrlReqBuilder();

  PreSignedUrlReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileName = $v.fileName;
      _contentType = $v.contentType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PreSignedUrlReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreSignedUrlReq;
  }

  @override
  void update(void Function(PreSignedUrlReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PreSignedUrlReq build() => _build();

  _$PreSignedUrlReq _build() {
    final _$result = _$v ??
        new _$PreSignedUrlReq._(fileName: fileName, contentType: contentType);
    replace(_$result);
    return _$result;
  }
}

class _$PreSignedUrlRes extends PreSignedUrlRes {
  @override
  final String? url;
  @override
  final Fields? fields;
  @override
  final String? fileName;

  factory _$PreSignedUrlRes([void Function(PreSignedUrlResBuilder)? updates]) =>
      (new PreSignedUrlResBuilder()..update(updates))._build();

  _$PreSignedUrlRes._({this.url, this.fields, this.fileName}) : super._();

  @override
  PreSignedUrlRes rebuild(void Function(PreSignedUrlResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreSignedUrlResBuilder toBuilder() =>
      new PreSignedUrlResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreSignedUrlRes &&
        url == other.url &&
        fields == other.fields &&
        fileName == other.fileName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreSignedUrlRes')
          ..add('url', url)
          ..add('fields', fields)
          ..add('fileName', fileName))
        .toString();
  }
}

class PreSignedUrlResBuilder
    implements Builder<PreSignedUrlRes, PreSignedUrlResBuilder> {
  _$PreSignedUrlRes? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  FieldsBuilder? _fields;
  FieldsBuilder get fields => _$this._fields ??= new FieldsBuilder();
  set fields(FieldsBuilder? fields) => _$this._fields = fields;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  PreSignedUrlResBuilder();

  PreSignedUrlResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _fields = $v.fields?.toBuilder();
      _fileName = $v.fileName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PreSignedUrlRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreSignedUrlRes;
  }

  @override
  void update(void Function(PreSignedUrlResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PreSignedUrlRes build() => _build();

  _$PreSignedUrlRes _build() {
    _$PreSignedUrlRes _$result;
    try {
      _$result = _$v ??
          new _$PreSignedUrlRes._(
              url: url, fields: _fields?.build(), fileName: fileName);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PreSignedUrlRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Fields extends Fields {
  @override
  final String? contentType;
  @override
  final String? key;
  @override
  final String? aWSAccessKeyId;
  @override
  final String? xAmzCredential;
  @override
  final String? xAmzDate;
  @override
  final String? policy;
  @override
  final String? signature;

  factory _$Fields([void Function(FieldsBuilder)? updates]) =>
      (new FieldsBuilder()..update(updates))._build();

  _$Fields._(
      {this.contentType,
      this.key,
      this.aWSAccessKeyId,
      this.xAmzCredential,
      this.xAmzDate,
      this.policy,
      this.signature})
      : super._();

  @override
  Fields rebuild(void Function(FieldsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldsBuilder toBuilder() => new FieldsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fields &&
        contentType == other.contentType &&
        key == other.key &&
        aWSAccessKeyId == other.aWSAccessKeyId &&
        xAmzCredential == other.xAmzCredential &&
        xAmzDate == other.xAmzDate &&
        policy == other.policy &&
        signature == other.signature;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, aWSAccessKeyId.hashCode);
    _$hash = $jc(_$hash, xAmzCredential.hashCode);
    _$hash = $jc(_$hash, xAmzDate.hashCode);
    _$hash = $jc(_$hash, policy.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Fields')
          ..add('contentType', contentType)
          ..add('key', key)
          ..add('aWSAccessKeyId', aWSAccessKeyId)
          ..add('xAmzCredential', xAmzCredential)
          ..add('xAmzDate', xAmzDate)
          ..add('policy', policy)
          ..add('signature', signature))
        .toString();
  }
}

class FieldsBuilder implements Builder<Fields, FieldsBuilder> {
  _$Fields? _$v;

  String? _contentType;
  String? get contentType => _$this._contentType;
  set contentType(String? contentType) => _$this._contentType = contentType;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _aWSAccessKeyId;
  String? get aWSAccessKeyId => _$this._aWSAccessKeyId;
  set aWSAccessKeyId(String? aWSAccessKeyId) =>
      _$this._aWSAccessKeyId = aWSAccessKeyId;

  String? _xAmzCredential;
  String? get xAmzCredential => _$this._xAmzCredential;
  set xAmzCredential(String? xAmzCredential) =>
      _$this._xAmzCredential = xAmzCredential;

  String? _xAmzDate;
  String? get xAmzDate => _$this._xAmzDate;
  set xAmzDate(String? xAmzDate) => _$this._xAmzDate = xAmzDate;

  String? _policy;
  String? get policy => _$this._policy;
  set policy(String? policy) => _$this._policy = policy;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  FieldsBuilder();

  FieldsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _key = $v.key;
      _aWSAccessKeyId = $v.aWSAccessKeyId;
      _xAmzCredential = $v.xAmzCredential;
      _xAmzDate = $v.xAmzDate;
      _policy = $v.policy;
      _signature = $v.signature;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Fields other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Fields;
  }

  @override
  void update(void Function(FieldsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Fields build() => _build();

  _$Fields _build() {
    final _$result = _$v ??
        new _$Fields._(
            contentType: contentType,
            key: key,
            aWSAccessKeyId: aWSAccessKeyId,
            xAmzCredential: xAmzCredential,
            xAmzDate: xAmzDate,
            policy: policy,
            signature: signature);
    replace(_$result);
    return _$result;
  }
}

class _$ImageUploadResponseModel extends ImageUploadResponseModel {
  @override
  final Urls? urls;

  factory _$ImageUploadResponseModel(
          [void Function(ImageUploadResponseModelBuilder)? updates]) =>
      (new ImageUploadResponseModelBuilder()..update(updates))._build();

  _$ImageUploadResponseModel._({this.urls}) : super._();

  @override
  ImageUploadResponseModel rebuild(
          void Function(ImageUploadResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageUploadResponseModelBuilder toBuilder() =>
      new ImageUploadResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageUploadResponseModel && urls == other.urls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImageUploadResponseModel')
          ..add('urls', urls))
        .toString();
  }
}

class ImageUploadResponseModelBuilder
    implements
        Builder<ImageUploadResponseModel, ImageUploadResponseModelBuilder> {
  _$ImageUploadResponseModel? _$v;

  UrlsBuilder? _urls;
  UrlsBuilder get urls => _$this._urls ??= new UrlsBuilder();
  set urls(UrlsBuilder? urls) => _$this._urls = urls;

  ImageUploadResponseModelBuilder();

  ImageUploadResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _urls = $v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageUploadResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImageUploadResponseModel;
  }

  @override
  void update(void Function(ImageUploadResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImageUploadResponseModel build() => _build();

  _$ImageUploadResponseModel _build() {
    _$ImageUploadResponseModel _$result;
    try {
      _$result = _$v ?? new _$ImageUploadResponseModel._(urls: _urls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        _urls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ImageUploadResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Urls extends Urls {
  @override
  final int? id;
  @override
  final String? original;
  @override
  final String? thumbnail;

  factory _$Urls([void Function(UrlsBuilder)? updates]) =>
      (new UrlsBuilder()..update(updates))._build();

  _$Urls._({this.id, this.original, this.thumbnail}) : super._();

  @override
  Urls rebuild(void Function(UrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UrlsBuilder toBuilder() => new UrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Urls &&
        id == other.id &&
        original == other.original &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, original.hashCode);
    _$hash = $jc(_$hash, thumbnail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Urls')
          ..add('id', id)
          ..add('original', original)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class UrlsBuilder implements Builder<Urls, UrlsBuilder> {
  _$Urls? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _original;
  String? get original => _$this._original;
  set original(String? original) => _$this._original = original;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  UrlsBuilder();

  UrlsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _original = $v.original;
      _thumbnail = $v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Urls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Urls;
  }

  @override
  void update(void Function(UrlsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Urls build() => _build();

  _$Urls _build() {
    final _$result =
        _$v ?? new _$Urls._(id: id, original: original, thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
