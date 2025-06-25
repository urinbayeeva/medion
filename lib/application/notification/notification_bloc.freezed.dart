// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'NotificationEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetNotificationImplCopyWith<$Res> {
  factory _$$GetNotificationImplCopyWith(_$GetNotificationImpl value,
          $Res Function(_$GetNotificationImpl) then) =
      __$$GetNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetNotificationImpl>
    implements _$$GetNotificationImplCopyWith<$Res> {
  __$$GetNotificationImplCopyWithImpl(
      _$GetNotificationImpl _value, $Res Function(_$GetNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationImpl implements _GetNotification {
  const _$GetNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.getNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return getNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return getNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetNotification implements NotificationEvent {
  const factory _GetNotification() = _$GetNotificationImpl;
}

/// @nodoc
abstract class _$$GetMoreNotificationImplCopyWith<$Res> {
  factory _$$GetMoreNotificationImplCopyWith(_$GetMoreNotificationImpl value,
          $Res Function(_$GetMoreNotificationImpl) then) =
      __$$GetMoreNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMoreNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetMoreNotificationImpl>
    implements _$$GetMoreNotificationImplCopyWith<$Res> {
  __$$GetMoreNotificationImplCopyWithImpl(_$GetMoreNotificationImpl _value,
      $Res Function(_$GetMoreNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMoreNotificationImpl implements _GetMoreNotification {
  const _$GetMoreNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.getMoreNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return getMoreNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return getMoreNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (getMoreNotifications != null) {
      return getMoreNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return getMoreNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return getMoreNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (getMoreNotifications != null) {
      return getMoreNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetMoreNotification implements NotificationEvent {
  const factory _GetMoreNotification() = _$GetMoreNotificationImpl;
}

/// @nodoc
abstract class _$$MarkAllNotificationAsReadImplCopyWith<$Res> {
  factory _$$MarkAllNotificationAsReadImplCopyWith(
          _$MarkAllNotificationAsReadImpl value,
          $Res Function(_$MarkAllNotificationAsReadImpl) then) =
      __$$MarkAllNotificationAsReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkAllNotificationAsReadImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$MarkAllNotificationAsReadImpl>
    implements _$$MarkAllNotificationAsReadImplCopyWith<$Res> {
  __$$MarkAllNotificationAsReadImplCopyWithImpl(
      _$MarkAllNotificationAsReadImpl _value,
      $Res Function(_$MarkAllNotificationAsReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkAllNotificationAsReadImpl implements _MarkAllNotificationAsRead {
  const _$MarkAllNotificationAsReadImpl();

  @override
  String toString() {
    return 'NotificationEvent.markAllNotificationAsRead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAllNotificationAsReadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return markAllNotificationAsRead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return markAllNotificationAsRead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (markAllNotificationAsRead != null) {
      return markAllNotificationAsRead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return markAllNotificationAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return markAllNotificationAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (markAllNotificationAsRead != null) {
      return markAllNotificationAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAllNotificationAsRead implements NotificationEvent {
  const factory _MarkAllNotificationAsRead() = _$MarkAllNotificationAsReadImpl;
}

/// @nodoc
abstract class _$$ReadNotificationImplCopyWith<$Res> {
  factory _$$ReadNotificationImplCopyWith(_$ReadNotificationImpl value,
          $Res Function(_$ReadNotificationImpl) then) =
      __$$ReadNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ReadNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ReadNotificationImpl>
    implements _$$ReadNotificationImplCopyWith<$Res> {
  __$$ReadNotificationImplCopyWithImpl(_$ReadNotificationImpl _value,
      $Res Function(_$ReadNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ReadNotificationImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReadNotificationImpl implements _ReadNotification {
  const _$ReadNotificationImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'NotificationEvent.readNotification(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadNotificationImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadNotificationImplCopyWith<_$ReadNotificationImpl> get copyWith =>
      __$$ReadNotificationImplCopyWithImpl<_$ReadNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return readNotification(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return readNotification?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return readNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return readNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(this);
    }
    return orElse();
  }
}

abstract class _ReadNotification implements NotificationEvent {
  const factory _ReadNotification({required final int index}) =
      _$ReadNotificationImpl;

  int get index;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadNotificationImplCopyWith<_$ReadNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFCMTokenImplCopyWith<$Res> {
  factory _$$SetFCMTokenImplCopyWith(
          _$SetFCMTokenImpl value, $Res Function(_$SetFCMTokenImpl) then) =
      __$$SetFCMTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetFCMTokenImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$SetFCMTokenImpl>
    implements _$$SetFCMTokenImplCopyWith<$Res> {
  __$$SetFCMTokenImplCopyWithImpl(
      _$SetFCMTokenImpl _value, $Res Function(_$SetFCMTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetFCMTokenImpl implements _SetFCMToken {
  const _$SetFCMTokenImpl();

  @override
  String toString() {
    return 'NotificationEvent.setFCMToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetFCMTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotifications,
    required TResult Function() getMoreNotifications,
    required TResult Function() markAllNotificationAsRead,
    required TResult Function(int index) readNotification,
    required TResult Function() setFCMToken,
  }) {
    return setFCMToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotifications,
    TResult? Function()? getMoreNotifications,
    TResult? Function()? markAllNotificationAsRead,
    TResult? Function(int index)? readNotification,
    TResult? Function()? setFCMToken,
  }) {
    return setFCMToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotifications,
    TResult Function()? getMoreNotifications,
    TResult Function()? markAllNotificationAsRead,
    TResult Function(int index)? readNotification,
    TResult Function()? setFCMToken,
    required TResult orElse(),
  }) {
    if (setFCMToken != null) {
      return setFCMToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotification value) getNotifications,
    required TResult Function(_GetMoreNotification value) getMoreNotifications,
    required TResult Function(_MarkAllNotificationAsRead value)
        markAllNotificationAsRead,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_SetFCMToken value) setFCMToken,
  }) {
    return setFCMToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotification value)? getNotifications,
    TResult? Function(_GetMoreNotification value)? getMoreNotifications,
    TResult? Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_SetFCMToken value)? setFCMToken,
  }) {
    return setFCMToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotification value)? getNotifications,
    TResult Function(_GetMoreNotification value)? getMoreNotifications,
    TResult Function(_MarkAllNotificationAsRead value)?
        markAllNotificationAsRead,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_SetFCMToken value)? setFCMToken,
    required TResult orElse(),
  }) {
    if (setFCMToken != null) {
      return setFCMToken(this);
    }
    return orElse();
  }
}

abstract class _SetFCMToken implements NotificationEvent {
  const factory _SetFCMToken() = _$SetFCMTokenImpl;
}

/// @nodoc
mixin _$NotificationState {
  bool get notificationsFetchMore => throw _privateConstructorUsedError;
  FormzSubmissionStatus get notificationStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get markAllNotificationStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get readOnlyStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get singleStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get setFcmTokenStatus =>
      throw _privateConstructorUsedError;
  String get markAsReadErrorMsg => throw _privateConstructorUsedError;
  String get notificationsErrorMessage => throw _privateConstructorUsedError;
  String get notificationNext => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  NotificationModel? get singleNotification =>
      throw _privateConstructorUsedError;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {bool notificationsFetchMore,
      FormzSubmissionStatus notificationStatus,
      FormzSubmissionStatus markAllNotificationStatus,
      FormzSubmissionStatus readOnlyStatus,
      FormzSubmissionStatus singleStatus,
      FormzSubmissionStatus setFcmTokenStatus,
      String markAsReadErrorMsg,
      String notificationsErrorMessage,
      String notificationNext,
      List<NotificationModel> notifications,
      NotificationModel? singleNotification});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsFetchMore = null,
    Object? notificationStatus = null,
    Object? markAllNotificationStatus = null,
    Object? readOnlyStatus = null,
    Object? singleStatus = null,
    Object? setFcmTokenStatus = null,
    Object? markAsReadErrorMsg = null,
    Object? notificationsErrorMessage = null,
    Object? notificationNext = null,
    Object? notifications = null,
    Object? singleNotification = freezed,
  }) {
    return _then(_value.copyWith(
      notificationsFetchMore: null == notificationsFetchMore
          ? _value.notificationsFetchMore
          : notificationsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationStatus: null == notificationStatus
          ? _value.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      markAllNotificationStatus: null == markAllNotificationStatus
          ? _value.markAllNotificationStatus
          : markAllNotificationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      readOnlyStatus: null == readOnlyStatus
          ? _value.readOnlyStatus
          : readOnlyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      singleStatus: null == singleStatus
          ? _value.singleStatus
          : singleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      setFcmTokenStatus: null == setFcmTokenStatus
          ? _value.setFcmTokenStatus
          : setFcmTokenStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      markAsReadErrorMsg: null == markAsReadErrorMsg
          ? _value.markAsReadErrorMsg
          : markAsReadErrorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsErrorMessage: null == notificationsErrorMessage
          ? _value.notificationsErrorMessage
          : notificationsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      notificationNext: null == notificationNext
          ? _value.notificationNext
          : notificationNext // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      singleNotification: freezed == singleNotification
          ? _value.singleNotification
          : singleNotification // ignore: cast_nullable_to_non_nullable
              as NotificationModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool notificationsFetchMore,
      FormzSubmissionStatus notificationStatus,
      FormzSubmissionStatus markAllNotificationStatus,
      FormzSubmissionStatus readOnlyStatus,
      FormzSubmissionStatus singleStatus,
      FormzSubmissionStatus setFcmTokenStatus,
      String markAsReadErrorMsg,
      String notificationsErrorMessage,
      String notificationNext,
      List<NotificationModel> notifications,
      NotificationModel? singleNotification});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsFetchMore = null,
    Object? notificationStatus = null,
    Object? markAllNotificationStatus = null,
    Object? readOnlyStatus = null,
    Object? singleStatus = null,
    Object? setFcmTokenStatus = null,
    Object? markAsReadErrorMsg = null,
    Object? notificationsErrorMessage = null,
    Object? notificationNext = null,
    Object? notifications = null,
    Object? singleNotification = freezed,
  }) {
    return _then(_$NotificationStateImpl(
      notificationsFetchMore: null == notificationsFetchMore
          ? _value.notificationsFetchMore
          : notificationsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationStatus: null == notificationStatus
          ? _value.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      markAllNotificationStatus: null == markAllNotificationStatus
          ? _value.markAllNotificationStatus
          : markAllNotificationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      readOnlyStatus: null == readOnlyStatus
          ? _value.readOnlyStatus
          : readOnlyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      singleStatus: null == singleStatus
          ? _value.singleStatus
          : singleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      setFcmTokenStatus: null == setFcmTokenStatus
          ? _value.setFcmTokenStatus
          : setFcmTokenStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      markAsReadErrorMsg: null == markAsReadErrorMsg
          ? _value.markAsReadErrorMsg
          : markAsReadErrorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsErrorMessage: null == notificationsErrorMessage
          ? _value.notificationsErrorMessage
          : notificationsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      notificationNext: null == notificationNext
          ? _value.notificationNext
          : notificationNext // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      singleNotification: freezed == singleNotification
          ? _value.singleNotification
          : singleNotification // ignore: cast_nullable_to_non_nullable
              as NotificationModel?,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl extends _NotificationState {
  const _$NotificationStateImpl(
      {this.notificationsFetchMore = false,
      this.notificationStatus = FormzSubmissionStatus.initial,
      this.markAllNotificationStatus = FormzSubmissionStatus.initial,
      this.readOnlyStatus = FormzSubmissionStatus.initial,
      this.singleStatus = FormzSubmissionStatus.initial,
      this.setFcmTokenStatus = FormzSubmissionStatus.initial,
      this.markAsReadErrorMsg = '',
      this.notificationsErrorMessage = '',
      this.notificationNext = '',
      final List<NotificationModel> notifications = const [],
      this.singleNotification})
      : _notifications = notifications,
        super._();

  @override
  @JsonKey()
  final bool notificationsFetchMore;
  @override
  @JsonKey()
  final FormzSubmissionStatus notificationStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus markAllNotificationStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus readOnlyStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus singleStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus setFcmTokenStatus;
  @override
  @JsonKey()
  final String markAsReadErrorMsg;
  @override
  @JsonKey()
  final String notificationsErrorMessage;
  @override
  @JsonKey()
  final String notificationNext;
  final List<NotificationModel> _notifications;
  @override
  @JsonKey()
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final NotificationModel? singleNotification;

  @override
  String toString() {
    return 'NotificationState(notificationsFetchMore: $notificationsFetchMore, notificationStatus: $notificationStatus, markAllNotificationStatus: $markAllNotificationStatus, readOnlyStatus: $readOnlyStatus, singleStatus: $singleStatus, setFcmTokenStatus: $setFcmTokenStatus, markAsReadErrorMsg: $markAsReadErrorMsg, notificationsErrorMessage: $notificationsErrorMessage, notificationNext: $notificationNext, notifications: $notifications, singleNotification: $singleNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.notificationsFetchMore, notificationsFetchMore) ||
                other.notificationsFetchMore == notificationsFetchMore) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus) &&
            (identical(other.markAllNotificationStatus,
                    markAllNotificationStatus) ||
                other.markAllNotificationStatus == markAllNotificationStatus) &&
            (identical(other.readOnlyStatus, readOnlyStatus) ||
                other.readOnlyStatus == readOnlyStatus) &&
            (identical(other.singleStatus, singleStatus) ||
                other.singleStatus == singleStatus) &&
            (identical(other.setFcmTokenStatus, setFcmTokenStatus) ||
                other.setFcmTokenStatus == setFcmTokenStatus) &&
            (identical(other.markAsReadErrorMsg, markAsReadErrorMsg) ||
                other.markAsReadErrorMsg == markAsReadErrorMsg) &&
            (identical(other.notificationsErrorMessage,
                    notificationsErrorMessage) ||
                other.notificationsErrorMessage == notificationsErrorMessage) &&
            (identical(other.notificationNext, notificationNext) ||
                other.notificationNext == notificationNext) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.singleNotification, singleNotification) ||
                other.singleNotification == singleNotification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationsFetchMore,
      notificationStatus,
      markAllNotificationStatus,
      readOnlyStatus,
      singleStatus,
      setFcmTokenStatus,
      markAsReadErrorMsg,
      notificationsErrorMessage,
      notificationNext,
      const DeepCollectionEquality().hash(_notifications),
      singleNotification);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState extends NotificationState {
  const factory _NotificationState(
      {final bool notificationsFetchMore,
      final FormzSubmissionStatus notificationStatus,
      final FormzSubmissionStatus markAllNotificationStatus,
      final FormzSubmissionStatus readOnlyStatus,
      final FormzSubmissionStatus singleStatus,
      final FormzSubmissionStatus setFcmTokenStatus,
      final String markAsReadErrorMsg,
      final String notificationsErrorMessage,
      final String notificationNext,
      final List<NotificationModel> notifications,
      final NotificationModel? singleNotification}) = _$NotificationStateImpl;
  const _NotificationState._() : super._();

  @override
  bool get notificationsFetchMore;
  @override
  FormzSubmissionStatus get notificationStatus;
  @override
  FormzSubmissionStatus get markAllNotificationStatus;
  @override
  FormzSubmissionStatus get readOnlyStatus;
  @override
  FormzSubmissionStatus get singleStatus;
  @override
  FormzSubmissionStatus get setFcmTokenStatus;
  @override
  String get markAsReadErrorMsg;
  @override
  String get notificationsErrorMessage;
  @override
  String get notificationNext;
  @override
  List<NotificationModel> get notifications;
  @override
  NotificationModel? get singleNotification;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
