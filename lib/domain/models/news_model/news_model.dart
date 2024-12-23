import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/serializers/serializer.dart';

part 'news_model.g.dart';

abstract class News implements Built<News, NewsBuilder> {
  News._();

  factory News([Function(NewsBuilder b) updates]) = _$News;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'info')
  String? get info;

  @BuiltValueField(wireName: 'link')
  bool? get link;

  @BuiltValueField(wireName: 'image')
  String? get image;

  String toJson() {
    return json.encode(serializers.serializeWith(News.serializer, this));
  }

  static News? fromJson(String jsonString) {
    return serializers.deserializeWith(
        News.serializer, json.decode(jsonString));
  }

static Serializer<News> get serializer => _$newsSerializer; 
}
