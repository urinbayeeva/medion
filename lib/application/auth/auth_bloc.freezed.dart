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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
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
abstract class _$$FetchPaymentUrlsImplCopyWith<$Res> {
  factory _$$FetchPaymentUrlsImplCopyWith(_$FetchPaymentUrlsImpl value,
          $Res Function(_$FetchPaymentUrlsImpl) then) =
      __$$FetchPaymentUrlsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPaymentUrlsImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchPaymentUrlsImpl>
    implements _$$FetchPaymentUrlsImplCopyWith<$Res> {
  __$$FetchPaymentUrlsImplCopyWithImpl(_$FetchPaymentUrlsImpl _value,
      $Res Function(_$FetchPaymentUrlsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchPaymentUrlsImpl implements _FetchPaymentUrls {
  const _$FetchPaymentUrlsImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchPaymentUrls()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchPaymentUrlsImpl);
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
  }) {
    return fetchPaymentUrls();
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
  }) {
    return fetchPaymentUrls?.call();
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchPaymentUrls != null) {
      return fetchPaymentUrls();
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
  }) {
    return fetchPaymentUrls(this);
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
  }) {
    return fetchPaymentUrls?.call(this);
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchPaymentUrls != null) {
      return fetchPaymentUrls(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentUrls implements AuthEvent {
  const factory _FetchPaymentUrls() = _$FetchPaymentUrlsImpl;
}

/// @nodoc
abstract class _$$FetchPatientAnalyzeImplCopyWith<$Res> {
  factory _$$FetchPatientAnalyzeImplCopyWith(_$FetchPatientAnalyzeImpl value,
          $Res Function(_$FetchPatientAnalyzeImpl) then) =
      __$$FetchPatientAnalyzeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPatientAnalyzeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchPatientAnalyzeImpl>
    implements _$$FetchPatientAnalyzeImplCopyWith<$Res> {
  __$$FetchPatientAnalyzeImplCopyWithImpl(_$FetchPatientAnalyzeImpl _value,
      $Res Function(_$FetchPatientAnalyzeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchPatientAnalyzeImpl implements _FetchPatientAnalyze {
  const _$FetchPatientAnalyzeImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchPatientAnalyze()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPatientAnalyzeImpl);
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
  }) {
    return fetchPatientAnalyze();
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
  }) {
    return fetchPatientAnalyze?.call();
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchPatientAnalyze != null) {
      return fetchPatientAnalyze();
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
  }) {
    return fetchPatientAnalyze(this);
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
  }) {
    return fetchPatientAnalyze?.call(this);
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchPatientAnalyze != null) {
      return fetchPatientAnalyze(this);
    }
    return orElse();
  }
}

abstract class _FetchPatientAnalyze implements AuthEvent {
  const factory _FetchPatientAnalyze() = _$FetchPatientAnalyzeImpl;
}

/// @nodoc
abstract class _$$FetchMyWalletImplCopyWith<$Res> {
  factory _$$FetchMyWalletImplCopyWith(
          _$FetchMyWalletImpl value, $Res Function(_$FetchMyWalletImpl) then) =
      __$$FetchMyWalletImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMyWalletImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchMyWalletImpl>
    implements _$$FetchMyWalletImplCopyWith<$Res> {
  __$$FetchMyWalletImplCopyWithImpl(
      _$FetchMyWalletImpl _value, $Res Function(_$FetchMyWalletImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchMyWalletImpl implements _FetchMyWallet {
  const _$FetchMyWalletImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchMyWallet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMyWalletImpl);
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
    required TResult Function() fetchPaymentUrls,
    required TResult Function() fetchPatientAnalyze,
    required TResult Function() fetchMyWallet,
  }) {
    return fetchMyWallet();
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
    TResult? Function()? fetchPaymentUrls,
    TResult? Function()? fetchPatientAnalyze,
    TResult? Function()? fetchMyWallet,
  }) {
    return fetchMyWallet?.call();
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
    TResult Function()? fetchPaymentUrls,
    TResult Function()? fetchPatientAnalyze,
    TResult Function()? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchMyWallet != null) {
      return fetchMyWallet();
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
    required TResult Function(_FetchPaymentUrls value) fetchPaymentUrls,
    required TResult Function(_FetchPatientAnalyze value) fetchPatientAnalyze,
    required TResult Function(_FetchMyWallet value) fetchMyWallet,
  }) {
    return fetchMyWallet(this);
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
    TResult? Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult? Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult? Function(_FetchMyWallet value)? fetchMyWallet,
  }) {
    return fetchMyWallet?.call(this);
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
    TResult Function(_FetchPaymentUrls value)? fetchPaymentUrls,
    TResult Function(_FetchPatientAnalyze value)? fetchPatientAnalyze,
    TResult Function(_FetchMyWallet value)? fetchMyWallet,
    required TResult orElse(),
  }) {
    if (fetchMyWallet != null) {
      return fetchMyWallet(this);
    }
    return orElse();
  }
}

abstract class _FetchMyWallet implements AuthEvent {
  const factory _FetchMyWallet() = _$FetchMyWalletImpl;
}

/// @nodoc
mixin _$AuthState {
  bool get proceedToHome => throw _privateConstructorUsedError;
  UserStatus get userStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get verifyStatus => throw _privateConstructorUsedError;
  bool get proceedToLogin => throw _privateConstructorUsedError;
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
  bool get isLoadingVisits => throw _privateConstructorUsedError;
  bool get errorFetchingVisits => throw _privateConstructorUsedError;
  List<VisitOrder?> get patientVisits => throw _privateConstructorUsedError;
  PatientDocuments? get patientAnalyze => throw _privateConstructorUsedError;
  bool? get isNewPatient => throw _privateConstructorUsedError;
  String? get paymeUrl => throw _privateConstructorUsedError;
  String? get clickUrl => throw _privateConstructorUsedError;
  bool get isFetchingPaymentUrls => throw _privateConstructorUsedError;
  bool get errorFetchingPaymentUrls => throw _privateConstructorUsedError;
  PaymentResponse? get myWallet => throw _privateConstructorUsedError;
  RegistrationResponse? get registrationResponse =>
      throw _privateConstructorUsedError;

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
      UserStatus userStatus,
      FormzSubmissionStatus verifyStatus,
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
      List<VisitOrder?> patientVisits,
      PatientDocuments? patientAnalyze,
      bool? isNewPatient,
      String? paymeUrl,
      String? clickUrl,
      bool isFetchingPaymentUrls,
      bool errorFetchingPaymentUrls,
      PaymentResponse? myWallet,
      RegistrationResponse? registrationResponse});
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
    Object? userStatus = null,
    Object? verifyStatus = null,
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
    Object? patientVisits = null,
    Object? patientAnalyze = freezed,
    Object? isNewPatient = freezed,
    Object? paymeUrl = freezed,
    Object? clickUrl = freezed,
    Object? isFetchingPaymentUrls = null,
    Object? errorFetchingPaymentUrls = null,
    Object? myWallet = freezed,
    Object? registrationResponse = freezed,
  }) {
    return _then(_value.copyWith(
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
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
      patientVisits: null == patientVisits
          ? _value.patientVisits
          : patientVisits // ignore: cast_nullable_to_non_nullable
              as List<VisitOrder?>,
      patientAnalyze: freezed == patientAnalyze
          ? _value.patientAnalyze
          : patientAnalyze // ignore: cast_nullable_to_non_nullable
              as PatientDocuments?,
      isNewPatient: freezed == isNewPatient
          ? _value.isNewPatient
          : isNewPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymeUrl: freezed == paymeUrl
          ? _value.paymeUrl
          : paymeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clickUrl: freezed == clickUrl
          ? _value.clickUrl
          : clickUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFetchingPaymentUrls: null == isFetchingPaymentUrls
          ? _value.isFetchingPaymentUrls
          : isFetchingPaymentUrls // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingPaymentUrls: null == errorFetchingPaymentUrls
          ? _value.errorFetchingPaymentUrls
          : errorFetchingPaymentUrls // ignore: cast_nullable_to_non_nullable
              as bool,
      myWallet: freezed == myWallet
          ? _value.myWallet
          : myWallet // ignore: cast_nullable_to_non_nullable
              as PaymentResponse?,
      registrationResponse: freezed == registrationResponse
          ? _value.registrationResponse
          : registrationResponse // ignore: cast_nullable_to_non_nullable
              as RegistrationResponse?,
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
      UserStatus userStatus,
      FormzSubmissionStatus verifyStatus,
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
      List<VisitOrder?> patientVisits,
      PatientDocuments? patientAnalyze,
      bool? isNewPatient,
      String? paymeUrl,
      String? clickUrl,
      bool isFetchingPaymentUrls,
      bool errorFetchingPaymentUrls,
      PaymentResponse? myWallet,
      RegistrationResponse? registrationResponse});
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
    Object? userStatus = null,
    Object? verifyStatus = null,
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
    Object? patientVisits = null,
    Object? patientAnalyze = freezed,
    Object? isNewPatient = freezed,
    Object? paymeUrl = freezed,
    Object? clickUrl = freezed,
    Object? isFetchingPaymentUrls = null,
    Object? errorFetchingPaymentUrls = null,
    Object? myWallet = freezed,
    Object? registrationResponse = freezed,
  }) {
    return _then(_$AuthStateImpl(
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
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
      patientVisits: null == patientVisits
          ? _value._patientVisits
          : patientVisits // ignore: cast_nullable_to_non_nullable
              as List<VisitOrder?>,
      patientAnalyze: freezed == patientAnalyze
          ? _value.patientAnalyze
          : patientAnalyze // ignore: cast_nullable_to_non_nullable
              as PatientDocuments?,
      isNewPatient: freezed == isNewPatient
          ? _value.isNewPatient
          : isNewPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymeUrl: freezed == paymeUrl
          ? _value.paymeUrl
          : paymeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clickUrl: freezed == clickUrl
          ? _value.clickUrl
          : clickUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFetchingPaymentUrls: null == isFetchingPaymentUrls
          ? _value.isFetchingPaymentUrls
          : isFetchingPaymentUrls // ignore: cast_nullable_to_non_nullable
              as bool,
      errorFetchingPaymentUrls: null == errorFetchingPaymentUrls
          ? _value.errorFetchingPaymentUrls
          : errorFetchingPaymentUrls // ignore: cast_nullable_to_non_nullable
              as bool,
      myWallet: freezed == myWallet
          ? _value.myWallet
          : myWallet // ignore: cast_nullable_to_non_nullable
              as PaymentResponse?,
      registrationResponse: freezed == registrationResponse
          ? _value.registrationResponse
          : registrationResponse // ignore: cast_nullable_to_non_nullable
              as RegistrationResponse?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {this.proceedToHome = false,
      this.userStatus = UserStatus.unknown,
      this.verifyStatus = FormzSubmissionStatus.initial,
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
      final List<VisitOrder?> patientVisits = const [],
      this.patientAnalyze = null,
      this.isNewPatient = null,
      this.paymeUrl = null,
      this.clickUrl = null,
      this.isFetchingPaymentUrls = false,
      this.errorFetchingPaymentUrls = false,
      this.myWallet = null,
      this.registrationResponse = null})
      : _patientVisits = patientVisits,
        super._();

  @override
  @JsonKey()
  final bool proceedToHome;
  @override
  @JsonKey()
  final UserStatus userStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus verifyStatus;
  @override
  @JsonKey()
  final bool proceedToLogin;
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
  @override
  @JsonKey()
  final bool errorFetchingVisits;
  final List<VisitOrder?> _patientVisits;
  @override
  @JsonKey()
  List<VisitOrder?> get patientVisits {
    if (_patientVisits is EqualUnmodifiableListView) return _patientVisits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientVisits);
  }

  @override
  @JsonKey()
  final PatientDocuments? patientAnalyze;
  @override
  @JsonKey()
  final bool? isNewPatient;
  @override
  @JsonKey()
  final String? paymeUrl;
  @override
  @JsonKey()
  final String? clickUrl;
  @override
  @JsonKey()
  final bool isFetchingPaymentUrls;
  @override
  @JsonKey()
  final bool errorFetchingPaymentUrls;
  @override
  @JsonKey()
  final PaymentResponse? myWallet;
  @override
  @JsonKey()
  final RegistrationResponse? registrationResponse;

  @override
  String toString() {
    return 'AuthState(proceedToHome: $proceedToHome, userStatus: $userStatus, verifyStatus: $verifyStatus, proceedToLogin: $proceedToLogin, successSendCode: $successSendCode, successVerifyCode: $successVerifyCode, successUpdatePhone: $successUpdatePhone, successSendUserInfo: $successSendUserInfo, errorSendCode: $errorSendCode, phoneNumber: $phoneNumber, patientInfo: $patientInfo, isFetchingPatientInfo: $isFetchingPatientInfo, errorFetchingPatientInfo: $errorFetchingPatientInfo, pickedImagePath: $pickedImagePath, isLoadingVisits: $isLoadingVisits, errorFetchingVisits: $errorFetchingVisits, patientVisits: $patientVisits, patientAnalyze: $patientAnalyze, isNewPatient: $isNewPatient, paymeUrl: $paymeUrl, clickUrl: $clickUrl, isFetchingPaymentUrls: $isFetchingPaymentUrls, errorFetchingPaymentUrls: $errorFetchingPaymentUrls, myWallet: $myWallet, registrationResponse: $registrationResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.proceedToHome, proceedToHome) ||
                other.proceedToHome == proceedToHome) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
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
            const DeepCollectionEquality()
                .equals(other._patientVisits, _patientVisits) &&
            (identical(other.patientAnalyze, patientAnalyze) ||
                other.patientAnalyze == patientAnalyze) &&
            (identical(other.isNewPatient, isNewPatient) ||
                other.isNewPatient == isNewPatient) &&
            (identical(other.paymeUrl, paymeUrl) ||
                other.paymeUrl == paymeUrl) &&
            (identical(other.clickUrl, clickUrl) ||
                other.clickUrl == clickUrl) &&
            (identical(other.isFetchingPaymentUrls, isFetchingPaymentUrls) ||
                other.isFetchingPaymentUrls == isFetchingPaymentUrls) &&
            (identical(
                    other.errorFetchingPaymentUrls, errorFetchingPaymentUrls) ||
                other.errorFetchingPaymentUrls == errorFetchingPaymentUrls) &&
            (identical(other.myWallet, myWallet) ||
                other.myWallet == myWallet) &&
            (identical(other.registrationResponse, registrationResponse) ||
                other.registrationResponse == registrationResponse));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        proceedToHome,
        userStatus,
        verifyStatus,
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
        const DeepCollectionEquality().hash(_patientVisits),
        patientAnalyze,
        isNewPatient,
        paymeUrl,
        clickUrl,
        isFetchingPaymentUrls,
        errorFetchingPaymentUrls,
        myWallet,
        registrationResponse
      ]);

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
      final UserStatus userStatus,
      final FormzSubmissionStatus verifyStatus,
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
      final List<VisitOrder?> patientVisits,
      final PatientDocuments? patientAnalyze,
      final bool? isNewPatient,
      final String? paymeUrl,
      final String? clickUrl,
      final bool isFetchingPaymentUrls,
      final bool errorFetchingPaymentUrls,
      final PaymentResponse? myWallet,
      final RegistrationResponse? registrationResponse}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  bool get proceedToHome;
  @override
  UserStatus get userStatus;
  @override
  FormzSubmissionStatus get verifyStatus;
  @override
  bool get proceedToLogin;
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
  bool get isLoadingVisits;
  @override
  bool get errorFetchingVisits;
  @override
  List<VisitOrder?> get patientVisits;
  @override
  PatientDocuments? get patientAnalyze;
  @override
  bool? get isNewPatient;
  @override
  String? get paymeUrl;
  @override
  String? get clickUrl;
  @override
  bool get isFetchingPaymentUrls;
  @override
  bool get errorFetchingPaymentUrls;
  @override
  PaymentResponse? get myWallet;
  @override
  RegistrationResponse? get registrationResponse;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
