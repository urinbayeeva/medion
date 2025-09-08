// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchReqModel> _$searchReqModelSerializer =
    _$SearchReqModelSerializer();
Serializer<DoctorSearchText> _$doctorSearchTextSerializer =
    _$DoctorSearchTextSerializer();
Serializer<CategorySearchText> _$categorySearchTextSerializer =
    _$CategorySearchTextSerializer();
Serializer<MedionResponseSearchText> _$medionResponseSearchTextSerializer =
    _$MedionResponseSearchTextSerializer();

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
    final result = SearchReqModelBuilder();

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
    value = object.workExperience;
    if (value != null) {
      result
        ..add('work_experience')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  DoctorSearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorSearchTextBuilder();

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
        case 'work_experience':
          result.workExperience = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
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
  CategorySearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CategorySearchTextBuilder();

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
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
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
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
      'articles',
      serializers.serialize(object.articles,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
      'discounts',
      serializers.serialize(object.discounts,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
      'services',
      serializers.serialize(object.services,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
      'branches',
      serializers.serialize(object.branches,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategorySearchText)])),
    ];

    return result;
  }

  @override
  MedionResponseSearchText deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MedionResponseSearchTextBuilder();

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
                      BuiltList, const [const FullType(CategorySearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategorySearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'discounts':
          result.discounts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategorySearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategorySearchText)]))!
              as BuiltList<Object?>);
          break;
        case 'branches':
          result.branches.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategorySearchText)]))!
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
      (SearchReqModelBuilder()..update(updates))._build();

  _$SearchReqModel._({this.text}) : super._();
  @override
  SearchReqModel rebuild(void Function(SearchReqModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchReqModelBuilder toBuilder() => SearchReqModelBuilder()..replace(this);

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
        _$SearchReqModel._(
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
  @override
  final int? workExperience;

  factory _$DoctorSearchText(
          [void Function(DoctorSearchTextBuilder)? updates]) =>
      (DoctorSearchTextBuilder()..update(updates))._build();

  _$DoctorSearchText._(
      {this.id, this.name, this.job, this.image, this.workExperience})
      : super._();
  @override
  DoctorSearchText rebuild(void Function(DoctorSearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorSearchTextBuilder toBuilder() =>
      DoctorSearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorSearchText &&
        id == other.id &&
        name == other.name &&
        job == other.job &&
        image == other.image &&
        workExperience == other.workExperience;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, job.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, workExperience.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorSearchText')
          ..add('id', id)
          ..add('name', name)
          ..add('job', job)
          ..add('image', image)
          ..add('workExperience', workExperience))
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

  int? _workExperience;
  int? get workExperience => _$this._workExperience;
  set workExperience(int? workExperience) =>
      _$this._workExperience = workExperience;

  DoctorSearchTextBuilder();

  DoctorSearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _job = $v.job;
      _image = $v.image;
      _workExperience = $v.workExperience;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorSearchText other) {
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
        _$DoctorSearchText._(
          id: id,
          name: name,
          job: job,
          image: image,
          workExperience: workExperience,
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
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? image;

  factory _$CategorySearchText(
          [void Function(CategorySearchTextBuilder)? updates]) =>
      (CategorySearchTextBuilder()..update(updates))._build();

  _$CategorySearchText._(
      {this.id,
      this.name,
      this.icon,
      this.description,
      this.phone,
      this.address,
      this.image})
      : super._();
  @override
  CategorySearchText rebuild(
          void Function(CategorySearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategorySearchTextBuilder toBuilder() =>
      CategorySearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategorySearchText &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        phone == other.phone &&
        address == other.address &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategorySearchText')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon)
          ..add('description', description)
          ..add('phone', phone)
          ..add('address', address)
          ..add('image', image))
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

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  CategorySearchTextBuilder();

  CategorySearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _description = $v.description;
      _phone = $v.phone;
      _address = $v.address;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategorySearchText other) {
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
        _$CategorySearchText._(
          id: id,
          name: name,
          icon: icon,
          description: description,
          phone: phone,
          address: address,
          image: image,
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
  final BuiltList<CategorySearchText> news;
  @override
  final BuiltList<CategorySearchText> articles;
  @override
  final BuiltList<CategorySearchText> discounts;
  @override
  final BuiltList<CategorySearchText> services;
  @override
  final BuiltList<CategorySearchText> branches;

  factory _$MedionResponseSearchText(
          [void Function(MedionResponseSearchTextBuilder)? updates]) =>
      (MedionResponseSearchTextBuilder()..update(updates))._build();

  _$MedionResponseSearchText._(
      {required this.doctors,
      required this.categories,
      required this.news,
      required this.articles,
      required this.discounts,
      required this.services,
      required this.branches})
      : super._();
  @override
  MedionResponseSearchText rebuild(
          void Function(MedionResponseSearchTextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedionResponseSearchTextBuilder toBuilder() =>
      MedionResponseSearchTextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedionResponseSearchText &&
        doctors == other.doctors &&
        categories == other.categories &&
        news == other.news &&
        articles == other.articles &&
        discounts == other.discounts &&
        services == other.services &&
        branches == other.branches;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, news.hashCode);
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, discounts.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, branches.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedionResponseSearchText')
          ..add('doctors', doctors)
          ..add('categories', categories)
          ..add('news', news)
          ..add('articles', articles)
          ..add('discounts', discounts)
          ..add('services', services)
          ..add('branches', branches))
        .toString();
  }
}

class MedionResponseSearchTextBuilder
    implements
        Builder<MedionResponseSearchText, MedionResponseSearchTextBuilder> {
  _$MedionResponseSearchText? _$v;

  ListBuilder<DoctorSearchText>? _doctors;
  ListBuilder<DoctorSearchText> get doctors =>
      _$this._doctors ??= ListBuilder<DoctorSearchText>();
  set doctors(ListBuilder<DoctorSearchText>? doctors) =>
      _$this._doctors = doctors;

  ListBuilder<CategorySearchText>? _categories;
  ListBuilder<CategorySearchText> get categories =>
      _$this._categories ??= ListBuilder<CategorySearchText>();
  set categories(ListBuilder<CategorySearchText>? categories) =>
      _$this._categories = categories;

  ListBuilder<CategorySearchText>? _news;
  ListBuilder<CategorySearchText> get news =>
      _$this._news ??= ListBuilder<CategorySearchText>();
  set news(ListBuilder<CategorySearchText>? news) => _$this._news = news;

  ListBuilder<CategorySearchText>? _articles;
  ListBuilder<CategorySearchText> get articles =>
      _$this._articles ??= ListBuilder<CategorySearchText>();
  set articles(ListBuilder<CategorySearchText>? articles) =>
      _$this._articles = articles;

  ListBuilder<CategorySearchText>? _discounts;
  ListBuilder<CategorySearchText> get discounts =>
      _$this._discounts ??= ListBuilder<CategorySearchText>();
  set discounts(ListBuilder<CategorySearchText>? discounts) =>
      _$this._discounts = discounts;

  ListBuilder<CategorySearchText>? _services;
  ListBuilder<CategorySearchText> get services =>
      _$this._services ??= ListBuilder<CategorySearchText>();
  set services(ListBuilder<CategorySearchText>? services) =>
      _$this._services = services;

  ListBuilder<CategorySearchText>? _branches;
  ListBuilder<CategorySearchText> get branches =>
      _$this._branches ??= ListBuilder<CategorySearchText>();
  set branches(ListBuilder<CategorySearchText>? branches) =>
      _$this._branches = branches;

  MedionResponseSearchTextBuilder();

  MedionResponseSearchTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctors = $v.doctors.toBuilder();
      _categories = $v.categories.toBuilder();
      _news = $v.news.toBuilder();
      _articles = $v.articles.toBuilder();
      _discounts = $v.discounts.toBuilder();
      _services = $v.services.toBuilder();
      _branches = $v.branches.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedionResponseSearchText other) {
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
          _$MedionResponseSearchText._(
            doctors: doctors.build(),
            categories: categories.build(),
            news: news.build(),
            articles: articles.build(),
            discounts: discounts.build(),
            services: services.build(),
            branches: branches.build(),
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
        _$failedField = 'discounts';
        discounts.build();
        _$failedField = 'services';
        services.build();
        _$failedField = 'branches';
        branches.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MedionResponseSearchText', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
