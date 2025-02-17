// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(
          _$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) =
      __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthImpl>
    implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(
      _$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthEvent {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
abstract class _$$VerificationSendImplCopyWith<$Res> {
  factory _$$VerificationSendImplCopyWith(_$VerificationSendImpl value,
          $Res Function(_$VerificationSendImpl) then) =
      __$$VerificationSendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterReq request});
}

/// @nodoc
class __$$VerificationSendImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerificationSendImpl>
    implements _$$VerificationSendImplCopyWith<$Res> {
  __$$VerificationSendImplCopyWithImpl(_$VerificationSendImpl _value,
      $Res Function(_$VerificationSendImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$VerificationSendImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RegisterReq,
    ));
  }
}

/// @nodoc

class _$VerificationSendImpl implements _VerificationSend {
  const _$VerificationSendImpl({required this.request});

  @override
  final RegisterReq request;

  @override
  String toString() {
    return 'AuthEvent.verificationSend(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationSendImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationSendImplCopyWith<_$VerificationSendImpl> get copyWith =>
      __$$VerificationSendImplCopyWithImpl<_$VerificationSendImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return verificationSend(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return verificationSend?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (verificationSend != null) {
      return verificationSend(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return verificationSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return verificationSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (verificationSend != null) {
      return verificationSend(this);
    }
    return orElse();
  }
}

abstract class _VerificationSend implements AuthEvent {
  const factory _VerificationSend({required final RegisterReq request}) =
      _$VerificationSendImpl;

  RegisterReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationSendImplCopyWith<_$VerificationSendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendPhoneNumberImplCopyWith<$Res> {
  factory _$$SendPhoneNumberImplCopyWith(_$SendPhoneNumberImpl value,
          $Res Function(_$SendPhoneNumberImpl) then) =
      __$$SendPhoneNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhoneNumberSendReq request});
}

/// @nodoc
class __$$SendPhoneNumberImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendPhoneNumberImpl>
    implements _$$SendPhoneNumberImplCopyWith<$Res> {
  __$$SendPhoneNumberImplCopyWithImpl(
      _$SendPhoneNumberImpl _value, $Res Function(_$SendPhoneNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SendPhoneNumberImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as PhoneNumberSendReq,
    ));
  }
}

/// @nodoc

class _$SendPhoneNumberImpl implements _SendPhoneNumber {
  const _$SendPhoneNumberImpl({required this.request});

  @override
  final PhoneNumberSendReq request;

  @override
  String toString() {
    return 'AuthEvent.sendPhoneNumber(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPhoneNumberImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPhoneNumberImplCopyWith<_$SendPhoneNumberImpl> get copyWith =>
      __$$SendPhoneNumberImplCopyWithImpl<_$SendPhoneNumberImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return sendPhoneNumber(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return sendPhoneNumber?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (sendPhoneNumber != null) {
      return sendPhoneNumber(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return sendPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return sendPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (sendPhoneNumber != null) {
      return sendPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _SendPhoneNumber implements AuthEvent {
  const factory _SendPhoneNumber({required final PhoneNumberSendReq request}) =
      _$SendPhoneNumberImpl;

  PhoneNumberSendReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPhoneNumberImplCopyWith<_$SendPhoneNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendUserInfoImplCopyWith<$Res> {
  factory _$$SendUserInfoImplCopyWith(
          _$SendUserInfoImpl value, $Res Function(_$SendUserInfoImpl) then) =
      __$$SendUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateInfoReq request});
}

/// @nodoc
class __$$SendUserInfoImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendUserInfoImpl>
    implements _$$SendUserInfoImplCopyWith<$Res> {
  __$$SendUserInfoImplCopyWithImpl(
      _$SendUserInfoImpl _value, $Res Function(_$SendUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SendUserInfoImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateInfoReq,
    ));
  }
}

/// @nodoc

class _$SendUserInfoImpl implements _SendUserInfo {
  const _$SendUserInfoImpl({required this.request});

  @override
  final CreateInfoReq request;

  @override
  String toString() {
    return 'AuthEvent.sendUserInfo(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendUserInfoImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendUserInfoImplCopyWith<_$SendUserInfoImpl> get copyWith =>
      __$$SendUserInfoImplCopyWithImpl<_$SendUserInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return sendUserInfo(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return sendUserInfo?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (sendUserInfo != null) {
      return sendUserInfo(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return sendUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return sendUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (sendUserInfo != null) {
      return sendUserInfo(this);
    }
    return orElse();
  }
}

abstract class _SendUserInfo implements AuthEvent {
  const factory _SendUserInfo({required final CreateInfoReq request}) =
      _$SendUserInfoImpl;

  CreateInfoReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendUserInfoImplCopyWith<_$SendUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPatientInfoImplCopyWith<$Res> {
  factory _$$FetchPatientInfoImplCopyWith(_$FetchPatientInfoImpl value,
          $Res Function(_$FetchPatientInfoImpl) then) =
      __$$FetchPatientInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPatientInfoImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchPatientInfoImpl>
    implements _$$FetchPatientInfoImplCopyWith<$Res> {
  __$$FetchPatientInfoImplCopyWithImpl(_$FetchPatientInfoImpl _value,
      $Res Function(_$FetchPatientInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchPatientInfoImpl implements _FetchPatientInfo {
  const _$FetchPatientInfoImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchPatientInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchPatientInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return fetchPatientInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return fetchPatientInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (fetchPatientInfo != null) {
      return fetchPatientInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return fetchPatientInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return fetchPatientInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (fetchPatientInfo != null) {
      return fetchPatientInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchPatientInfo implements AuthEvent {
  const factory _FetchPatientInfo() = _$FetchPatientInfoImpl;
}

/// @nodoc
abstract class _$$PickImageImplCopyWith<$Res> {
  factory _$$PickImageImplCopyWith(
          _$PickImageImpl value, $Res Function(_$PickImageImpl) then) =
      __$$PickImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$PickImageImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PickImageImpl>
    implements _$$PickImageImplCopyWith<$Res> {
  __$$PickImageImplCopyWithImpl(
      _$PickImageImpl _value, $Res Function(_$PickImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$PickImageImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$PickImageImpl implements _PickImage {
  const _$PickImageImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthEvent.pickImage(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickImageImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      __$$PickImageImplCopyWithImpl<_$PickImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return pickImage(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return pickImage?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements AuthEvent {
  const factory _PickImage(final BuildContext context) = _$PickImageImpl;

  BuildContext get context;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPatientVisitsImplCopyWith<$Res> {
  factory _$$FetchPatientVisitsImplCopyWith(_$FetchPatientVisitsImpl value,
          $Res Function(_$FetchPatientVisitsImpl) then) =
      __$$FetchPatientVisitsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPatientVisitsImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchPatientVisitsImpl>
    implements _$$FetchPatientVisitsImplCopyWith<$Res> {
  __$$FetchPatientVisitsImplCopyWithImpl(_$FetchPatientVisitsImpl _value,
      $Res Function(_$FetchPatientVisitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchPatientVisitsImpl implements _FetchPatientVisits {
  const _$FetchPatientVisitsImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchPatientVisits()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchPatientVisitsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(RegisterReq request) verificationSend,
    required TResult Function(PhoneNumberSendReq request) sendPhoneNumber,
    required TResult Function(CreateInfoReq request) sendUserInfo,
    required TResult Function() fetchPatientInfo,
    required TResult Function(BuildContext context) pickImage,
    required TResult Function() fetchPatientVisits,
  }) {
    return fetchPatientVisits();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(RegisterReq request)? verificationSend,
    TResult? Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult? Function(CreateInfoReq request)? sendUserInfo,
    TResult? Function()? fetchPatientInfo,
    TResult? Function(BuildContext context)? pickImage,
    TResult? Function()? fetchPatientVisits,
  }) {
    return fetchPatientVisits?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(RegisterReq request)? verificationSend,
    TResult Function(PhoneNumberSendReq request)? sendPhoneNumber,
    TResult Function(CreateInfoReq request)? sendUserInfo,
    TResult Function()? fetchPatientInfo,
    TResult Function(BuildContext context)? pickImage,
    TResult Function()? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (fetchPatientVisits != null) {
      return fetchPatientVisits();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_SendUserInfo value) sendUserInfo,
    required TResult Function(_FetchPatientInfo value) fetchPatientInfo,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_FetchPatientVisits value) fetchPatientVisits,
  }) {
    return fetchPatientVisits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_SendUserInfo value)? sendUserInfo,
    TResult? Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_FetchPatientVisits value)? fetchPatientVisits,
  }) {
    return fetchPatientVisits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_SendUserInfo value)? sendUserInfo,
    TResult Function(_FetchPatientInfo value)? fetchPatientInfo,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_FetchPatientVisits value)? fetchPatientVisits,
    required TResult orElse(),
  }) {
    if (fetchPatientVisits != null) {
      return fetchPatientVisits(this);
    }
    return orElse();
  }
}

abstract class _FetchPatientVisits implements AuthEvent {
  const factory _FetchPatientVisits() = _$FetchPatientVisitsImpl;
}

/// @nodoc
mixin _$AuthState {
  bool get proceedToHome => throw _privateConstructorUsedError;
  bool get proceedToLogin => throw _privateConstructorUsedError; //
  bool get successSendCode => throw _privateConstructorUsedError;
  bool get successVerifyCode => throw _privateConstructorUsedError;
  bool get successUpdatePhone => throw _privateConstructorUsedError;
  bool get successSendUserInfo => throw _privateConstructorUsedError;
  bool get errorSendCode => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  PatientInfo? get patientInfo => throw _privateConstructorUsedError;
  bool get isFetchingPatientInfo => throw _privateConstructorUsedError;
  bool get errorFetchingPatientInfo => throw _privateConstructorUsedError;
  String? get pickedImagePath => throw _privateConstructorUsedError;
  bool get isLoadingVisits =>
      throw _privateConstructorUsedError; // Add isLoadingVisits
  bool get errorFetchingVisits =>
      throw _privateConstructorUsedError; // Add errorFetchingVisits
  VisitModel? get patientVisits => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool proceedToHome,
      bool proceedToLogin,
      bool successSendCode,
      bool successVerifyCode,
      bool successUpdatePhone,
      bool successSendUserInfo,
      bool errorSendCode,
      String? phoneNumber,
      PatientInfo? patientInfo,
      bool isFetchingPatientInfo,
      bool errorFetchingPatientInfo,
      String? pickedImagePath,
      bool isLoadingVisits,
      bool errorFetchingVisits,
      VisitModel? patientVisits});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proceedToHome = null,
    Object? proceedToLogin = null,
    Object? successSendCode = null,
    Object? successVerifyCode = null,
    Object? successUpdatePhone = null,
    Object? successSendUserInfo = null,
    Object? errorSendCode = null,
    Object? phoneNumber = freezed,
    Object? patientInfo = freezed,
    Object? isFetchingPatientInfo = null,
    Object? errorFetchingPatientInfo = null,
    Object? pickedImagePath = freezed,
    Object? isLoadingVisits = null,
    Object? errorFetchingVisits = null,
    Object? patientVisits = freezed,
  }) {
    return _then(_value.copyWith(
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToLogin: null == proceedToLogin
          ? _value.proceedToLogin
          : proceedToLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      successSendCode: null == successSendCode
          ? _value.successSendCode
          : successSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      successVerifyCode: null == successVerifyCode
          ? _value.successVerifyCode
          : successVerifyCode // ignore: cast_nullable_to_non_nullable
              as bool,
      successUpdatePhone: null == successUpdatePhone
          ? _value.successUpdatePhone
          : successUpdatePhone // ignore: cast_nullable_to_non_nullable
              as bool,
      successSendUserInfo: null == successSendUserInfo
          ? _value.successSendUserInfo
          : successSendUserInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      errorSendCode: null == errorSendCode
          ? _value.errorSendCode
          : errorSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      patientInfo: freezed == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfo?,
      isFetchingPatientInfo: null == isFetchingPatientInfo
          ? _value.isFetchingPatientInfo
          : isFetchingPatientInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingPatientInfo: null == errorFetchingPatientInfo
          ? _value.errorFetchingPatientInfo
          : errorFetchingPatientInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoadingVisits: null == isLoadingVisits
          ? _value.isLoadingVisits
          : isLoadingVisits // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingVisits: null == errorFetchingVisits
          ? _value.errorFetchingVisits
          : errorFetchingVisits // ignore: cast_nullable_to_non_nullable
              as bool,
      patientVisits: freezed == patientVisits
          ? _value.patientVisits
          : patientVisits // ignore: cast_nullable_to_non_nullable
              as VisitModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool proceedToHome,
      bool proceedToLogin,
      bool successSendCode,
      bool successVerifyCode,
      bool successUpdatePhone,
      bool successSendUserInfo,
      bool errorSendCode,
      String? phoneNumber,
      PatientInfo? patientInfo,
      bool isFetchingPatientInfo,
      bool errorFetchingPatientInfo,
      String? pickedImagePath,
      bool isLoadingVisits,
      bool errorFetchingVisits,
      VisitModel? patientVisits});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proceedToHome = null,
    Object? proceedToLogin = null,
    Object? successSendCode = null,
    Object? successVerifyCode = null,
    Object? successUpdatePhone = null,
    Object? successSendUserInfo = null,
    Object? errorSendCode = null,
    Object? phoneNumber = freezed,
    Object? patientInfo = freezed,
    Object? isFetchingPatientInfo = null,
    Object? errorFetchingPatientInfo = null,
    Object? pickedImagePath = freezed,
    Object? isLoadingVisits = null,
    Object? errorFetchingVisits = null,
    Object? patientVisits = freezed,
  }) {
    return _then(_$AuthStateImpl(
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToLogin: null == proceedToLogin
          ? _value.proceedToLogin
          : proceedToLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      successSendCode: null == successSendCode
          ? _value.successSendCode
          : successSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      successVerifyCode: null == successVerifyCode
          ? _value.successVerifyCode
          : successVerifyCode // ignore: cast_nullable_to_non_nullable
              as bool,
      successUpdatePhone: null == successUpdatePhone
          ? _value.successUpdatePhone
          : successUpdatePhone // ignore: cast_nullable_to_non_nullable
              as bool,
      successSendUserInfo: null == successSendUserInfo
          ? _value.successSendUserInfo
          : successSendUserInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      errorSendCode: null == errorSendCode
          ? _value.errorSendCode
          : errorSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      patientInfo: freezed == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfo?,
      isFetchingPatientInfo: null == isFetchingPatientInfo
          ? _value.isFetchingPatientInfo
          : isFetchingPatientInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingPatientInfo: null == errorFetchingPatientInfo
          ? _value.errorFetchingPatientInfo
          : errorFetchingPatientInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoadingVisits: null == isLoadingVisits
          ? _value.isLoadingVisits
          : isLoadingVisits // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingVisits: null == errorFetchingVisits
          ? _value.errorFetchingVisits
          : errorFetchingVisits // ignore: cast_nullable_to_non_nullable
              as bool,
      patientVisits: freezed == patientVisits
          ? _value.patientVisits
          : patientVisits // ignore: cast_nullable_to_non_nullable
              as VisitModel?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {this.proceedToHome = false,
      this.proceedToLogin = false,
      this.successSendCode = false,
      this.successVerifyCode = false,
      this.successUpdatePhone = false,
      this.successSendUserInfo = false,
      this.errorSendCode = false,
      this.phoneNumber = null,
      this.patientInfo = null,
      this.isFetchingPatientInfo = false,
      this.errorFetchingPatientInfo = false,
      this.pickedImagePath = null,
      this.isLoadingVisits = false,
      this.errorFetchingVisits = false,
      this.patientVisits = null})
      : super._();

  @override
  @JsonKey()
  final bool proceedToHome;
  @override
  @JsonKey()
  final bool proceedToLogin;
//
  @override
  @JsonKey()
  final bool successSendCode;
  @override
  @JsonKey()
  final bool successVerifyCode;
  @override
  @JsonKey()
  final bool successUpdatePhone;
  @override
  @JsonKey()
  final bool successSendUserInfo;
  @override
  @JsonKey()
  final bool errorSendCode;
  @override
  @JsonKey()
  final String? phoneNumber;
  @override
  @JsonKey()
  final PatientInfo? patientInfo;
  @override
  @JsonKey()
  final bool isFetchingPatientInfo;
  @override
  @JsonKey()
  final bool errorFetchingPatientInfo;
  @override
  @JsonKey()
  final String? pickedImagePath;
  @override
  @JsonKey()
  final bool isLoadingVisits;
// Add isLoadingVisits
  @override
  @JsonKey()
  final bool errorFetchingVisits;
// Add errorFetchingVisits
  @override
  @JsonKey()
  final VisitModel? patientVisits;

  @override
  String toString() {
    return 'AuthState(proceedToHome: $proceedToHome, proceedToLogin: $proceedToLogin, successSendCode: $successSendCode, successVerifyCode: $successVerifyCode, successUpdatePhone: $successUpdatePhone, successSendUserInfo: $successSendUserInfo, errorSendCode: $errorSendCode, phoneNumber: $phoneNumber, patientInfo: $patientInfo, isFetchingPatientInfo: $isFetchingPatientInfo, errorFetchingPatientInfo: $errorFetchingPatientInfo, pickedImagePath: $pickedImagePath, isLoadingVisits: $isLoadingVisits, errorFetchingVisits: $errorFetchingVisits, patientVisits: $patientVisits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.proceedToHome, proceedToHome) ||
                other.proceedToHome == proceedToHome) &&
            (identical(other.proceedToLogin, proceedToLogin) ||
                other.proceedToLogin == proceedToLogin) &&
            (identical(other.successSendCode, successSendCode) ||
                other.successSendCode == successSendCode) &&
            (identical(other.successVerifyCode, successVerifyCode) ||
                other.successVerifyCode == successVerifyCode) &&
            (identical(other.successUpdatePhone, successUpdatePhone) ||
                other.successUpdatePhone == successUpdatePhone) &&
            (identical(other.successSendUserInfo, successSendUserInfo) ||
                other.successSendUserInfo == successSendUserInfo) &&
            (identical(other.errorSendCode, errorSendCode) ||
                other.errorSendCode == errorSendCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.patientInfo, patientInfo) ||
                other.patientInfo == patientInfo) &&
            (identical(other.isFetchingPatientInfo, isFetchingPatientInfo) ||
                other.isFetchingPatientInfo == isFetchingPatientInfo) &&
            (identical(
                    other.errorFetchingPatientInfo, errorFetchingPatientInfo) ||
                other.errorFetchingPatientInfo == errorFetchingPatientInfo) &&
            (identical(other.pickedImagePath, pickedImagePath) ||
                other.pickedImagePath == pickedImagePath) &&
            (identical(other.isLoadingVisits, isLoadingVisits) ||
                other.isLoadingVisits == isLoadingVisits) &&
            (identical(other.errorFetchingVisits, errorFetchingVisits) ||
                other.errorFetchingVisits == errorFetchingVisits) &&
            (identical(other.patientVisits, patientVisits) ||
                other.patientVisits == patientVisits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      proceedToHome,
      proceedToLogin,
      successSendCode,
      successVerifyCode,
      successUpdatePhone,
      successSendUserInfo,
      errorSendCode,
      phoneNumber,
      patientInfo,
      isFetchingPatientInfo,
      errorFetchingPatientInfo,
      pickedImagePath,
      isLoadingVisits,
      errorFetchingVisits,
      patientVisits);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final bool proceedToHome,
      final bool proceedToLogin,
      final bool successSendCode,
      final bool successVerifyCode,
      final bool successUpdatePhone,
      final bool successSendUserInfo,
      final bool errorSendCode,
      final String? phoneNumber,
      final PatientInfo? patientInfo,
      final bool isFetchingPatientInfo,
      final bool errorFetchingPatientInfo,
      final String? pickedImagePath,
      final bool isLoadingVisits,
      final bool errorFetchingVisits,
      final VisitModel? patientVisits}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  bool get proceedToHome;
  @override
  bool get proceedToLogin; //
  @override
  bool get successSendCode;
  @override
  bool get successVerifyCode;
  @override
  bool get successUpdatePhone;
  @override
  bool get successSendUserInfo;
  @override
  bool get errorSendCode;
  @override
  String? get phoneNumber;
  @override
  PatientInfo? get patientInfo;
  @override
  bool get isFetchingPatientInfo;
  @override
  bool get errorFetchingPatientInfo;
  @override
  String? get pickedImagePath;
  @override
  bool get isLoadingVisits; // Add isLoadingVisits
  @override
  bool get errorFetchingVisits; // Add errorFetchingVisits
  @override
  VisitModel? get patientVisits;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
