import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/serializers/serializer.dart';

part 'upload_image.g.dart';

abstract class PreSignedUrlReq
    implements Built<PreSignedUrlReq, PreSignedUrlReqBuilder> {
  PreSignedUrlReq._();

  factory PreSignedUrlReq([Function(PreSignedUrlReqBuilder b) updates]) =
      _$PreSignedUrlReq;

  @BuiltValueField(wireName: 'file_name')
  String? get fileName;

  @BuiltValueField(wireName: 'content_type')
  String? get contentType;

  static Serializer<PreSignedUrlReq> get serializer =>
      _$preSignedUrlReqSerializer;
}

abstract class PreSignedUrlRes
    implements Built<PreSignedUrlRes, PreSignedUrlResBuilder> {
  PreSignedUrlRes._();

  factory PreSignedUrlRes([Function(PreSignedUrlResBuilder b) updates]) =
      _$PreSignedUrlRes;

  @BuiltValueField(wireName: 'url')
  String? get url;

  @BuiltValueField(wireName: 'fields')
  Fields? get fields;

  @BuiltValueField(wireName: 'file_name')
  String? get fileName;

  static Serializer<PreSignedUrlRes> get serializer =>
      _$preSignedUrlResSerializer;
}

abstract class Fields implements Built<Fields, FieldsBuilder> {
  Fields._();

  factory Fields([Function(FieldsBuilder b) updates]) = _$Fields;

  @BuiltValueField(wireName: 'Content-Type')
  String? get contentType;

  @BuiltValueField(wireName: 'key')
  String? get key;

  @BuiltValueField(wireName: 'AWSAccessKeyId')
  String? get aWSAccessKeyId;

  @BuiltValueField(wireName: 'x-amz-credential')
  String? get xAmzCredential;

  @BuiltValueField(wireName: 'x-amz-date')
  String? get xAmzDate;

  @BuiltValueField(wireName: 'policy')
  String? get policy;

  @BuiltValueField(wireName: 'signature')
  String? get signature;

  String toJson() {
    return json.encode(serializers.serializeWith(Fields.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return json.decode(
        json.encode(serializers.serializeWith(Fields.serializer, this)));
  }

  static Serializer<Fields> get serializer => _$fieldsSerializer;
}

abstract class ImageUploadResponseModel
    implements
        Built<ImageUploadResponseModel, ImageUploadResponseModelBuilder> {
  ImageUploadResponseModel._();

  factory ImageUploadResponseModel(
          [Function(ImageUploadResponseModelBuilder b) updates]) =
      _$ImageUploadResponseModel;

  @BuiltValueField(wireName: 'urls')
  Urls? get urls;
  String toJson() {
    return json.encode(
        serializers.serializeWith(ImageUploadResponseModel.serializer, this));
  }

  static ImageUploadResponseModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImageUploadResponseModel.serializer, json.decode(jsonString));
  }

  static Serializer<ImageUploadResponseModel> get serializer =>
      _$imageUploadResponseModelSerializer;
}

abstract class Urls implements Built<Urls, UrlsBuilder> {
  Urls._();

  factory Urls([Function(UrlsBuilder b) updates]) = _$Urls;
  @BuiltValueField(wireName: 'id')
  int? get id;
  @BuiltValueField(wireName: 'original')
  String? get original;
  @BuiltValueField(wireName: 'thumbnail')
  String? get thumbnail;
  String toJson() {
    return json.encode(serializers.serializeWith(Urls.serializer, this));
  }

  static Urls? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Urls.serializer, json.decode(jsonString));
  }

  static Serializer<Urls> get serializer => _$urlsSerializer;
}