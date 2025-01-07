// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BookingTypeModel.serializer)
      ..add(CategoryServiceIDModel.serializer)
      ..add(CreateInfoReq.serializer)
      ..add(Doctor.serializer)
      ..add(DoctorCategory.serializer)
      ..add(News.serializer)
      ..add(Service.serializer)
      ..add(SuccessModel.serializer)
      ..add(VerificationSendReq.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Doctor)]),
          () => new ListBuilder<Doctor>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Service)]),
          () => new ListBuilder<Service>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
