// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BookingTypeModel.serializer)
      ..add(Category.serializer)
      ..add(CreateInfoReq.serializer)
      ..add(DoctorCategory.serializer)
      ..add(DoctorData.serializer)
      ..add(News.serializer)
      ..add(Service.serializer)
      ..add(SuccessModel.serializer)
      ..add(VerificationSendReq.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DoctorData)]),
          () => new ListBuilder<DoctorData>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Service)]),
          () => new ListBuilder<Service>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
