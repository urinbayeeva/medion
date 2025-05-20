// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchReqModel> _$searchReqModelSerializer =
    new _$SearchReqModelSerializer();
Serializer<DoctorSearchText> _$doctorSearchTextSerializer =
    new _$DoctorSearchTextSerializer();
Serializer<CategorySearchText> _$categorySearchTextSerializer =
    new _$CategorySearchTextSerializer();
Serializer<MedionResponseSearchText> _$medionResponseSearchTextSerializer =
    new _$MedionResponseSearchTextSerializer();

class _$SearchReqModelSerializer
    implements StructuredSerializer<SearchReqModel> {
  @override
  final Iterable<Type> types = const [SearchReqModel, _$SearchReqModel];
  @override
  final String wireName = 'SearchReqModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchReqModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchReqModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchReqModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorSearchTextSerializer
    implements StructuredSerializer<DoctorSearchText> {
  @override
  final Iterable<Type> types = const [DoctorSearchText, _$DoctorSearchText];
  @override
  final String wireName = 'DoctorSearchText';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorSearchText object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.job;
    if (value != null) {
      result
        ..add('job')
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
  DoctorSearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorSearchTextBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job':
          result.job = serializers.deserialize(value,
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

class _$CategorySearchTextSerializer
    implements StructuredSerializer<CategorySearchText> {
  @override
  final Iterable<Type> types = const [CategorySearchText, _$CategorySearchText];
  @override
  final String wireName = 'CategorySearchText';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CategorySearchText object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CategorySearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategorySearchTextBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MedionResponseSearchTextSerializer
    implements StructuredSerializer<MedionResponseSearchText> {
  @override
  final Iterable<Type> types = const [
    MedionResponseSearchText,
    _$MedionResponseSearchText
  ];
  @override
  final String wireName = 'MedionResponseSearchText';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MedionResponseSearchText object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'doctors',
      serializers.serialize(object.doctors,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DoctorSearchText)])),
      'categories',
      serializers.serialize(object.categories,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
      'news',
      serializers.serialize(object.news,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
      'articles',
      serializers.serialize(object.articles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  MedionResponseSearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedionResponseSearchTextBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorSearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategorySearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'news':
          result.news.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchReqModel extends SearchReqModel {
  @override
  final String? text;

  factory _$SearchReqModel([void Function(SearchReqModelBuilder)? updates]) =>
      (new SearchReqModelBuilder()..update(updates))._build();

  _$SearchReqModel._({this.text}) : super._();

  @override
  SearchReqModel rebuild(void Function(SearchReqModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchReqModelBuilder toBuilder() =>
      new SearchReqModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchReqModel && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchReqModel')..add('text', text))
        .toString();
  }
}

class SearchReqModelBuilder
    implements Builder<SearchReqModel, SearchReqModelBuilder> {
  _$SearchReqModel? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  SearchReqModelBuilder();

  SearchReqModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchReqModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchReqModel;
  }

  @override
  void update(void Function(SearchReqModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchReqModel build() => _build();

  _$SearchReqModel _build() {
    final _$result = _$v ??
        new _$SearchReqModel._(
          text: text,
        );
    replace(_$result);
    return _$result;
  }
}

class _$DoctorSearchText extends DoctorSearchText {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? job;
  @override
  final String? image;

  factory _$DoctorSearchText(
          [void Function(DoctorSearchTextBuilder)? updates]) =>
      (new DoctorSearchTextBuilder()..update(updates))._build();

  _$DoctorSearchText._({this.id, this.name, this.job, this.image}) : super._();

  @override
  DoctorSearchText rebuild(void Function(DoctorSearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorSearchTextBuilder toBuilder() =>
      new DoctorSearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorSearchText &&
        id == other.id &&
        name == other.name &&
        job == other.job &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, job.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorSearchText')
          ..add('id', id)
          ..add('name', name)
          ..add('job', job)
          ..add('image', image))
        .toString();
  }
}

class DoctorSearchTextBuilder
    implements Builder<DoctorSearchText, DoctorSearchTextBuilder> {
  _$DoctorSearchText? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _job;
  String? get job => _$this._job;
  set job(String? job) => _$this._job = job;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DoctorSearchTextBuilder();

  DoctorSearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _job = $v.job;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorSearchText other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorSearchText;
  }

  @override
  void update(void Function(DoctorSearchTextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorSearchText build() => _build();

  _$DoctorSearchText _build() {
    final _$result = _$v ??
        new _$DoctorSearchText._(
          id: id,
          name: name,
          job: job,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

class _$CategorySearchText extends CategorySearchText {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final String? description;

  factory _$CategorySearchText(
          [void Function(CategorySearchTextBuilder)? updates]) =>
      (new CategorySearchTextBuilder()..update(updates))._build();

  _$CategorySearchText._({this.id, this.name, this.icon, this.description})
      : super._();

  @override
  CategorySearchText rebuild(
          void Function(CategorySearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategorySearchTextBuilder toBuilder() =>
      new CategorySearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategorySearchText &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategorySearchText')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon)
          ..add('description', description))
        .toString();
  }
}

class CategorySearchTextBuilder
    implements Builder<CategorySearchText, CategorySearchTextBuilder> {
  _$CategorySearchText? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CategorySearchTextBuilder();

  CategorySearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategorySearchText other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategorySearchText;
  }

  @override
  void update(void Function(CategorySearchTextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategorySearchText build() => _build();

  _$CategorySearchText _build() {
    final _$result = _$v ??
        new _$CategorySearchText._(
          id: id,
          name: name,
          icon: icon,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

class _$MedionResponseSearchText extends MedionResponseSearchText {
  @override
  final BuiltList<DoctorSearchText> doctors;
  @override
  final BuiltList<CategorySearchText> categories;
  @override
  final BuiltList<dynamic> news;
  @override
  final BuiltList<dynamic> articles;

  factory _$MedionResponseSearchText(
          [void Function(MedionResponseSearchTextBuilder)? updates]) =>
      (new MedionResponseSearchTextBuilder()..update(updates))._build();

  _$MedionResponseSearchText._(
      {required this.doctors,
      required this.categories,
      required this.news,
      required this.articles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        doctors, r'MedionResponseSearchText', 'doctors');
    BuiltValueNullFieldError.checkNotNull(
        categories, r'MedionResponseSearchText', 'categories');
    BuiltValueNullFieldError.checkNotNull(
        news, r'MedionResponseSearchText', 'news');
    BuiltValueNullFieldError.checkNotNull(
        articles, r'MedionResponseSearchText', 'articles');
  }

  @override
  MedionResponseSearchText rebuild(
          void Function(MedionResponseSearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedionResponseSearchTextBuilder toBuilder() =>
      new MedionResponseSearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedionResponseSearchText &&
        doctors == other.doctors &&
        categories == other.categories &&
        news == other.news &&
        articles == other.articles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, news.hashCode);
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedionResponseSearchText')
          ..add('doctors', doctors)
          ..add('categories', categories)
          ..add('news', news)
          ..add('articles', articles))
        .toString();
  }
}

class MedionResponseSearchTextBuilder
    implements
        Builder<MedionResponseSearchText, MedionResponseSearchTextBuilder> {
  _$MedionResponseSearchText? _$v;

  ListBuilder<DoctorSearchText>? _doctors;
  ListBuilder<DoctorSearchText> get doctors =>
      _$this._doctors ??= new ListBuilder<DoctorSearchText>();
  set doctors(ListBuilder<DoctorSearchText>? doctors) =>
      _$this._doctors = doctors;

  ListBuilder<CategorySearchText>? _categories;
  ListBuilder<CategorySearchText> get categories =>
      _$this._categories ??= new ListBuilder<CategorySearchText>();
  set categories(ListBuilder<CategorySearchText>? categories) =>
      _$this._categories = categories;

  ListBuilder<dynamic>? _news;
  ListBuilder<dynamic> get news => _$this._news ??= new ListBuilder<dynamic>();
  set news(ListBuilder<dynamic>? news) => _$this._news = news;

  ListBuilder<dynamic>? _articles;
  ListBuilder<dynamic> get articles =>
      _$this._articles ??= new ListBuilder<dynamic>();
  set articles(ListBuilder<dynamic>? articles) => _$this._articles = articles;

  MedionResponseSearchTextBuilder();

  MedionResponseSearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctors = $v.doctors.toBuilder();
      _categories = $v.categories.toBuilder();
      _news = $v.news.toBuilder();
      _articles = $v.articles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedionResponseSearchText other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedionResponseSearchText;
  }

  @override
  void update(void Function(MedionResponseSearchTextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedionResponseSearchText build() => _build();

  _$MedionResponseSearchText _build() {
    _$MedionResponseSearchText _$result;
    try {
      _$result = _$v ??
          new _$MedionResponseSearchText._(
            doctors: doctors.build(),
            categories: categories.build(),
            news: news.build(),
            articles: articles.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        doctors.build();
        _$failedField = 'categories';
        categories.build();
        _$failedField = 'news';
        news.build();
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MedionResponseSearchText', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
