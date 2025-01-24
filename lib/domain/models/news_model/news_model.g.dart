// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<News> _$newsSerializer = new _$NewsSerializer();

class _$NewsSerializer implements StructuredSerializer<News> {
  @override
  final Iterable<Type> types = const [News, _$News];
  @override
  final String wireName = 'News';

  @override
  Iterable<Object?> serialize(Serializers serializers, News object,
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
    value = object.link;
    if (value != null) {
      result
        ..add('link')
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
  News deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsBuilder();

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
        case 'link':
          result.link = serializers.deserialize(value,
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

class _$News extends News {
  @override
  final String? title;
  @override
  final String? info;
  @override
  final String? link;
  @override
  final String? image;

  factory _$News([void Function(NewsBuilder)? updates]) =>
      (new NewsBuilder()..update(updates))._build();

  _$News._({this.title, this.info, this.link, this.image}) : super._();

  @override
  News rebuild(void Function(NewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsBuilder toBuilder() => new NewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is News &&
        title == other.title &&
        info == other.info &&
        link == other.link &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'News')
          ..add('title', title)
          ..add('info', info)
          ..add('link', link)
          ..add('image', image))
        .toString();
  }
}

class NewsBuilder implements Builder<News, NewsBuilder> {
  _$News? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  NewsBuilder();

  NewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _info = $v.info;
      _link = $v.link;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(News other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$News;
  }

  @override
  void update(void Function(NewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  News build() => _build();

  _$News _build() {
    final _$result = _$v ??
        new _$News._(
          title: title,
          info: info,
          link: link,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
