// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _UnAuthenticated unAuthenticated() {
    return const _UnAuthenticated();
  }

  _Authenticated authenticated() {
    return const _Authenticated();
  }

  _PhoneSignInLoading phoneSignInLoading() {
    return const _PhoneSignInLoading();
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() authenticated,
    required TResult Function() phoneSignInLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_PhoneSignInLoading value) phoneSignInLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class _$UnAuthenticatedCopyWith<$Res> {
  factory _$UnAuthenticatedCopyWith(
          _UnAuthenticated value, $Res Function(_UnAuthenticated) then) =
      __$UnAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnAuthenticatedCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$UnAuthenticatedCopyWith<$Res> {
  __$UnAuthenticatedCopyWithImpl(
      _UnAuthenticated _value, $Res Function(_UnAuthenticated) _then)
      : super(_value, (v) => _then(v as _UnAuthenticated));

  @override
  _UnAuthenticated get _value => super._value as _UnAuthenticated;
}

/// @nodoc

class _$_UnAuthenticated implements _UnAuthenticated {
  const _$_UnAuthenticated();

  @override
  String toString() {
    return 'AppState.unAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() authenticated,
    required TResult Function() phoneSignInLoading,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_PhoneSignInLoading value) phoneSignInLoading,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticated implements AppState {
  const factory _UnAuthenticated() = _$_UnAuthenticated;
}

/// @nodoc
abstract class _$AuthenticatedCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) then) =
      __$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(
      _Authenticated _value, $Res Function(_Authenticated) _then)
      : super(_value, (v) => _then(v as _Authenticated));

  @override
  _Authenticated get _value => super._value as _Authenticated;
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'AppState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() authenticated,
    required TResult Function() phoneSignInLoading,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_PhoneSignInLoading value) phoneSignInLoading,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AppState {
  const factory _Authenticated() = _$_Authenticated;
}

/// @nodoc
abstract class _$PhoneSignInLoadingCopyWith<$Res> {
  factory _$PhoneSignInLoadingCopyWith(
          _PhoneSignInLoading value, $Res Function(_PhoneSignInLoading) then) =
      __$PhoneSignInLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PhoneSignInLoadingCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res>
    implements _$PhoneSignInLoadingCopyWith<$Res> {
  __$PhoneSignInLoadingCopyWithImpl(
      _PhoneSignInLoading _value, $Res Function(_PhoneSignInLoading) _then)
      : super(_value, (v) => _then(v as _PhoneSignInLoading));

  @override
  _PhoneSignInLoading get _value => super._value as _PhoneSignInLoading;
}

/// @nodoc

class _$_PhoneSignInLoading implements _PhoneSignInLoading {
  const _$_PhoneSignInLoading();

  @override
  String toString() {
    return 'AppState.phoneSignInLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PhoneSignInLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() authenticated,
    required TResult Function() phoneSignInLoading,
  }) {
    return phoneSignInLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
  }) {
    return phoneSignInLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? authenticated,
    TResult Function()? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (phoneSignInLoading != null) {
      return phoneSignInLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_PhoneSignInLoading value) phoneSignInLoading,
  }) {
    return phoneSignInLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
  }) {
    return phoneSignInLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_PhoneSignInLoading value)? phoneSignInLoading,
    required TResult orElse(),
  }) {
    if (phoneSignInLoading != null) {
      return phoneSignInLoading(this);
    }
    return orElse();
  }
}

abstract class _PhoneSignInLoading implements AppState {
  const factory _PhoneSignInLoading() = _$_PhoneSignInLoading;
}
