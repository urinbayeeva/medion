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
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
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
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
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
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
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
  $Res call({VerificationSendReq request});
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
              as VerificationSendReq,
    ));
  }
}

/// @nodoc

class _$VerificationSendImpl implements _VerificationSend {
  const _$VerificationSendImpl({required this.request});

  @override
  final VerificationSendReq request;

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
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return verificationSend(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return verificationSend?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
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
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return verificationSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return verificationSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (verificationSend != null) {
      return verificationSend(this);
    }
    return orElse();
  }
}

abstract class _VerificationSend implements AuthEvent {
  const factory _VerificationSend(
      {required final VerificationSendReq request}) = _$VerificationSendImpl;

  VerificationSendReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationSendImplCopyWith<_$VerificationSendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationVerifyImplCopyWith<$Res> {
  factory _$$VerificationVerifyImplCopyWith(_$VerificationVerifyImpl value,
          $Res Function(_$VerificationVerifyImpl) then) =
      __$$VerificationVerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerificationVerifyReq request});
}

/// @nodoc
class __$$VerificationVerifyImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerificationVerifyImpl>
    implements _$$VerificationVerifyImplCopyWith<$Res> {
  __$$VerificationVerifyImplCopyWithImpl(_$VerificationVerifyImpl _value,
      $Res Function(_$VerificationVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$VerificationVerifyImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as VerificationVerifyReq,
    ));
  }
}

/// @nodoc

class _$VerificationVerifyImpl implements _VerificationVerify {
  const _$VerificationVerifyImpl({required this.request});

  @override
  final VerificationVerifyReq request;

  @override
  String toString() {
    return 'AuthEvent.verificationVerify(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationVerifyImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationVerifyImplCopyWith<_$VerificationVerifyImpl> get copyWith =>
      __$$VerificationVerifyImplCopyWithImpl<_$VerificationVerifyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return verificationVerify(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return verificationVerify?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (verificationVerify != null) {
      return verificationVerify(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return verificationVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return verificationVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (verificationVerify != null) {
      return verificationVerify(this);
    }
    return orElse();
  }
}

abstract class _VerificationVerify implements AuthEvent {
  const factory _VerificationVerify(
          {required final VerificationVerifyReq request}) =
      _$VerificationVerifyImpl;

  VerificationVerifyReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationVerifyImplCopyWith<_$VerificationVerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdditionalNumberVerifyImplCopyWith<$Res> {
  factory _$$AdditionalNumberVerifyImplCopyWith(
          _$AdditionalNumberVerifyImpl value,
          $Res Function(_$AdditionalNumberVerifyImpl) then) =
      __$$AdditionalNumberVerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerificationVerifyReq request});
}

/// @nodoc
class __$$AdditionalNumberVerifyImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AdditionalNumberVerifyImpl>
    implements _$$AdditionalNumberVerifyImplCopyWith<$Res> {
  __$$AdditionalNumberVerifyImplCopyWithImpl(
      _$AdditionalNumberVerifyImpl _value,
      $Res Function(_$AdditionalNumberVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AdditionalNumberVerifyImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as VerificationVerifyReq,
    ));
  }
}

/// @nodoc

class _$AdditionalNumberVerifyImpl implements _AdditionalNumberVerify {
  const _$AdditionalNumberVerifyImpl({required this.request});

  @override
  final VerificationVerifyReq request;

  @override
  String toString() {
    return 'AuthEvent.additionalNumberVerify(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalNumberVerifyImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalNumberVerifyImplCopyWith<_$AdditionalNumberVerifyImpl>
      get copyWith => __$$AdditionalNumberVerifyImplCopyWithImpl<
          _$AdditionalNumberVerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return additionalNumberVerify(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return additionalNumberVerify?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (additionalNumberVerify != null) {
      return additionalNumberVerify(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return additionalNumberVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return additionalNumberVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (additionalNumberVerify != null) {
      return additionalNumberVerify(this);
    }
    return orElse();
  }
}

abstract class _AdditionalNumberVerify implements AuthEvent {
  const factory _AdditionalNumberVerify(
          {required final VerificationVerifyReq request}) =
      _$AdditionalNumberVerifyImpl;

  VerificationVerifyReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionalNumberVerifyImplCopyWith<_$AdditionalNumberVerifyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInImplCopyWith<$Res> {
  factory _$$SignInImplCopyWith(
          _$SignInImpl value, $Res Function(_$SignInImpl) then) =
      __$$SignInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignInReq request});
}

/// @nodoc
class __$$SignInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInImpl>
    implements _$$SignInImplCopyWith<$Res> {
  __$$SignInImplCopyWithImpl(
      _$SignInImpl _value, $Res Function(_$SignInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SignInImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as SignInReq,
    ));
  }
}

/// @nodoc

class _$SignInImpl implements _SignIn {
  const _$SignInImpl({required this.request});

  @override
  final SignInReq request;

  @override
  String toString() {
    return 'AuthEvent.signIn(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      __$$SignInImplCopyWithImpl<_$SignInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return signIn(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return signIn?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements AuthEvent {
  const factory _SignIn({required final SignInReq request}) = _$SignInImpl;

  SignInReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInBusinessImplCopyWith<$Res> {
  factory _$$SignInBusinessImplCopyWith(_$SignInBusinessImpl value,
          $Res Function(_$SignInBusinessImpl) then) =
      __$$SignInBusinessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignInReq request});
}

/// @nodoc
class __$$SignInBusinessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInBusinessImpl>
    implements _$$SignInBusinessImplCopyWith<$Res> {
  __$$SignInBusinessImplCopyWithImpl(
      _$SignInBusinessImpl _value, $Res Function(_$SignInBusinessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SignInBusinessImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as SignInReq,
    ));
  }
}

/// @nodoc

class _$SignInBusinessImpl implements _SignInBusiness {
  const _$SignInBusinessImpl({required this.request});

  @override
  final SignInReq request;

  @override
  String toString() {
    return 'AuthEvent.signInBusiness(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInBusinessImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInBusinessImplCopyWith<_$SignInBusinessImpl> get copyWith =>
      __$$SignInBusinessImplCopyWithImpl<_$SignInBusinessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return signInBusiness(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return signInBusiness?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (signInBusiness != null) {
      return signInBusiness(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return signInBusiness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return signInBusiness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (signInBusiness != null) {
      return signInBusiness(this);
    }
    return orElse();
  }
}

abstract class _SignInBusiness implements AuthEvent {
  const factory _SignInBusiness({required final SignInReq request}) =
      _$SignInBusinessImpl;

  SignInReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInBusinessImplCopyWith<_$SignInBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordImplCopyWith<$Res> {
  factory _$$UpdatePasswordImplCopyWith(_$UpdatePasswordImpl value,
          $Res Function(_$UpdatePasswordImpl) then) =
      __$$UpdatePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPasswordReq request});
}

/// @nodoc
class __$$UpdatePasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdatePasswordImpl>
    implements _$$UpdatePasswordImplCopyWith<$Res> {
  __$$UpdatePasswordImplCopyWithImpl(
      _$UpdatePasswordImpl _value, $Res Function(_$UpdatePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$UpdatePasswordImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ResetPasswordReq,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordImpl implements _UpdatePassword {
  const _$UpdatePasswordImpl({required this.request});

  @override
  final ResetPasswordReq request;

  @override
  String toString() {
    return 'AuthEvent.updatePassword(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      __$$UpdatePasswordImplCopyWithImpl<_$UpdatePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return updatePassword(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return updatePassword?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return updatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return updatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(this);
    }
    return orElse();
  }
}

abstract class _UpdatePassword implements AuthEvent {
  const factory _UpdatePassword({required final ResetPasswordReq request}) =
      _$UpdatePasswordImpl;

  ResetPasswordReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ForgotPasswordReqModel request});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordReqModel,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl implements _ForgotPassword {
  const _$ForgotPasswordImpl({required this.request});

  @override
  final ForgotPasswordReqModel request;

  @override
  String toString() {
    return 'AuthEvent.forgotPassword(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return forgotPassword(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return forgotPassword?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPassword implements AuthEvent {
  const factory _ForgotPassword(
      {required final ForgotPasswordReqModel request}) = _$ForgotPasswordImpl;

  ForgotPasswordReqModel get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePhoneImplCopyWith<$Res> {
  factory _$$UpdatePhoneImplCopyWith(
          _$UpdatePhoneImpl value, $Res Function(_$UpdatePhoneImpl) then) =
      __$$UpdatePhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerificationVerifyReq request});
}

/// @nodoc
class __$$UpdatePhoneImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdatePhoneImpl>
    implements _$$UpdatePhoneImplCopyWith<$Res> {
  __$$UpdatePhoneImplCopyWithImpl(
      _$UpdatePhoneImpl _value, $Res Function(_$UpdatePhoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$UpdatePhoneImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as VerificationVerifyReq,
    ));
  }
}

/// @nodoc

class _$UpdatePhoneImpl implements _UpdatePhone {
  const _$UpdatePhoneImpl({required this.request});

  @override
  final VerificationVerifyReq request;

  @override
  String toString() {
    return 'AuthEvent.updatePhone(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePhoneImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePhoneImplCopyWith<_$UpdatePhoneImpl> get copyWith =>
      __$$UpdatePhoneImplCopyWithImpl<_$UpdatePhoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(VerificationSendReq request) verificationSend,
    required TResult Function(VerificationVerifyReq request) verificationVerify,
    required TResult Function(VerificationVerifyReq request)
        additionalNumberVerify,
    required TResult Function(SignInReq request) signIn,
    required TResult Function(SignInReq request) signInBusiness,
    required TResult Function(ResetPasswordReq request) updatePassword,
    required TResult Function(ForgotPasswordReqModel request) forgotPassword,
    required TResult Function(VerificationVerifyReq request) updatePhone,
  }) {
    return updatePhone(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(VerificationSendReq request)? verificationSend,
    TResult? Function(VerificationVerifyReq request)? verificationVerify,
    TResult? Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult? Function(SignInReq request)? signIn,
    TResult? Function(SignInReq request)? signInBusiness,
    TResult? Function(ResetPasswordReq request)? updatePassword,
    TResult? Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult? Function(VerificationVerifyReq request)? updatePhone,
  }) {
    return updatePhone?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(VerificationSendReq request)? verificationSend,
    TResult Function(VerificationVerifyReq request)? verificationVerify,
    TResult Function(VerificationVerifyReq request)? additionalNumberVerify,
    TResult Function(SignInReq request)? signIn,
    TResult Function(SignInReq request)? signInBusiness,
    TResult Function(ResetPasswordReq request)? updatePassword,
    TResult Function(ForgotPasswordReqModel request)? forgotPassword,
    TResult Function(VerificationVerifyReq request)? updatePhone,
    required TResult orElse(),
  }) {
    if (updatePhone != null) {
      return updatePhone(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_VerificationSend value) verificationSend,
    required TResult Function(_VerificationVerify value) verificationVerify,
    required TResult Function(_AdditionalNumberVerify value)
        additionalNumberVerify,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInBusiness value) signInBusiness,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_UpdatePhone value) updatePhone,
  }) {
    return updatePhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_VerificationSend value)? verificationSend,
    TResult? Function(_VerificationVerify value)? verificationVerify,
    TResult? Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult? Function(_SignIn value)? signIn,
    TResult? Function(_SignInBusiness value)? signInBusiness,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_UpdatePhone value)? updatePhone,
  }) {
    return updatePhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_VerificationSend value)? verificationSend,
    TResult Function(_VerificationVerify value)? verificationVerify,
    TResult Function(_AdditionalNumberVerify value)? additionalNumberVerify,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInBusiness value)? signInBusiness,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_UpdatePhone value)? updatePhone,
    required TResult orElse(),
  }) {
    if (updatePhone != null) {
      return updatePhone(this);
    }
    return orElse();
  }
}

abstract class _UpdatePhone implements AuthEvent {
  const factory _UpdatePhone({required final VerificationVerifyReq request}) =
      _$UpdatePhoneImpl;

  VerificationVerifyReq get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePhoneImplCopyWith<_$UpdatePhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  bool get proceedToHome => throw _privateConstructorUsedError;
  bool get proceedToLogin => throw _privateConstructorUsedError; //
  bool get successSendCode => throw _privateConstructorUsedError;
  bool get successVerifyCode => throw _privateConstructorUsedError;
  bool get successUpdatePhone => throw _privateConstructorUsedError;
  bool get errorSendCode => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

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
      bool errorSendCode,
      String? phoneNumber});
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
    Object? errorSendCode = null,
    Object? phoneNumber = freezed,
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
      errorSendCode: null == errorSendCode
          ? _value.errorSendCode
          : errorSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      bool errorSendCode,
      String? phoneNumber});
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
    Object? errorSendCode = null,
    Object? phoneNumber = freezed,
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
      errorSendCode: null == errorSendCode
          ? _value.errorSendCode
          : errorSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.errorSendCode = false,
      this.phoneNumber = null})
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
  final bool errorSendCode;
  @override
  @JsonKey()
  final String? phoneNumber;

  @override
  String toString() {
    return 'AuthState(proceedToHome: $proceedToHome, proceedToLogin: $proceedToLogin, successSendCode: $successSendCode, successVerifyCode: $successVerifyCode, successUpdatePhone: $successUpdatePhone, errorSendCode: $errorSendCode, phoneNumber: $phoneNumber)';
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
            (identical(other.errorSendCode, errorSendCode) ||
                other.errorSendCode == errorSendCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      proceedToHome,
      proceedToLogin,
      successSendCode,
      successVerifyCode,
      successUpdatePhone,
      errorSendCode,
      phoneNumber);

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
      final bool errorSendCode,
      final String? phoneNumber}) = _$AuthStateImpl;
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
  bool get errorSendCode;
  @override
  String? get phoneNumber;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
