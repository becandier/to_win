// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainAppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppConfig appConfig,
            SharedPreferences sharedPreferences, PackageInfo packageInfo)
        success,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainAppStateSuccess value) success,
    required TResult Function(_MainAppStateLoading value) loading,
    required TResult Function(_MainAppStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainAppStateSuccess value)? success,
    TResult? Function(_MainAppStateLoading value)? loading,
    TResult? Function(_MainAppStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainAppStateSuccess value)? success,
    TResult Function(_MainAppStateLoading value)? loading,
    TResult Function(_MainAppStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainAppStateCopyWith<$Res> {
  factory $MainAppStateCopyWith(
          MainAppState value, $Res Function(MainAppState) then) =
      _$MainAppStateCopyWithImpl<$Res, MainAppState>;
}

/// @nodoc
class _$MainAppStateCopyWithImpl<$Res, $Val extends MainAppState>
    implements $MainAppStateCopyWith<$Res> {
  _$MainAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MainAppStateSuccessImplCopyWith<$Res> {
  factory _$$MainAppStateSuccessImplCopyWith(_$MainAppStateSuccessImpl value,
          $Res Function(_$MainAppStateSuccessImpl) then) =
      __$$MainAppStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AppConfig appConfig,
      SharedPreferences sharedPreferences,
      PackageInfo packageInfo});
}

/// @nodoc
class __$$MainAppStateSuccessImplCopyWithImpl<$Res>
    extends _$MainAppStateCopyWithImpl<$Res, _$MainAppStateSuccessImpl>
    implements _$$MainAppStateSuccessImplCopyWith<$Res> {
  __$$MainAppStateSuccessImplCopyWithImpl(_$MainAppStateSuccessImpl _value,
      $Res Function(_$MainAppStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = null,
    Object? sharedPreferences = null,
    Object? packageInfo = null,
  }) {
    return _then(_$MainAppStateSuccessImpl(
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
      sharedPreferences: null == sharedPreferences
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences,
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo,
    ));
  }
}

/// @nodoc

class _$MainAppStateSuccessImpl extends _MainAppStateSuccess
    with DiagnosticableTreeMixin {
  _$MainAppStateSuccessImpl(
      {required this.appConfig,
      required this.sharedPreferences,
      required this.packageInfo})
      : super._();

  @override
  final AppConfig appConfig;
  @override
  final SharedPreferences sharedPreferences;
  @override
  final PackageInfo packageInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.success(appConfig: $appConfig, sharedPreferences: $sharedPreferences, packageInfo: $packageInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainAppState.success'))
      ..add(DiagnosticsProperty('appConfig', appConfig))
      ..add(DiagnosticsProperty('sharedPreferences', sharedPreferences))
      ..add(DiagnosticsProperty('packageInfo', packageInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainAppStateSuccessImpl &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig) &&
            (identical(other.sharedPreferences, sharedPreferences) ||
                other.sharedPreferences == sharedPreferences) &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, appConfig, sharedPreferences, packageInfo);

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainAppStateSuccessImplCopyWith<_$MainAppStateSuccessImpl> get copyWith =>
      __$$MainAppStateSuccessImplCopyWithImpl<_$MainAppStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppConfig appConfig,
            SharedPreferences sharedPreferences, PackageInfo packageInfo)
        success,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return success(appConfig, sharedPreferences, packageInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return success?.call(appConfig, sharedPreferences, packageInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(appConfig, sharedPreferences, packageInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainAppStateSuccess value) success,
    required TResult Function(_MainAppStateLoading value) loading,
    required TResult Function(_MainAppStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainAppStateSuccess value)? success,
    TResult? Function(_MainAppStateLoading value)? loading,
    TResult? Function(_MainAppStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainAppStateSuccess value)? success,
    TResult Function(_MainAppStateLoading value)? loading,
    TResult Function(_MainAppStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _MainAppStateSuccess extends MainAppState {
  factory _MainAppStateSuccess(
      {required final AppConfig appConfig,
      required final SharedPreferences sharedPreferences,
      required final PackageInfo packageInfo}) = _$MainAppStateSuccessImpl;
  _MainAppStateSuccess._() : super._();

  AppConfig get appConfig;
  SharedPreferences get sharedPreferences;
  PackageInfo get packageInfo;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainAppStateSuccessImplCopyWith<_$MainAppStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainAppStateLoadingImplCopyWith<$Res> {
  factory _$$MainAppStateLoadingImplCopyWith(_$MainAppStateLoadingImpl value,
          $Res Function(_$MainAppStateLoadingImpl) then) =
      __$$MainAppStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainAppStateLoadingImplCopyWithImpl<$Res>
    extends _$MainAppStateCopyWithImpl<$Res, _$MainAppStateLoadingImpl>
    implements _$$MainAppStateLoadingImplCopyWith<$Res> {
  __$$MainAppStateLoadingImplCopyWithImpl(_$MainAppStateLoadingImpl _value,
      $Res Function(_$MainAppStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MainAppStateLoadingImpl extends _MainAppStateLoading
    with DiagnosticableTreeMixin {
  _$MainAppStateLoadingImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MainAppState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainAppStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppConfig appConfig,
            SharedPreferences sharedPreferences, PackageInfo packageInfo)
        success,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainAppStateSuccess value) success,
    required TResult Function(_MainAppStateLoading value) loading,
    required TResult Function(_MainAppStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainAppStateSuccess value)? success,
    TResult? Function(_MainAppStateLoading value)? loading,
    TResult? Function(_MainAppStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainAppStateSuccess value)? success,
    TResult Function(_MainAppStateLoading value)? loading,
    TResult Function(_MainAppStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _MainAppStateLoading extends MainAppState {
  factory _MainAppStateLoading() = _$MainAppStateLoadingImpl;
  _MainAppStateLoading._() : super._();
}

/// @nodoc
abstract class _$$MainAppStateErrorImplCopyWith<$Res> {
  factory _$$MainAppStateErrorImplCopyWith(_$MainAppStateErrorImpl value,
          $Res Function(_$MainAppStateErrorImpl) then) =
      __$$MainAppStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainAppStateErrorImplCopyWithImpl<$Res>
    extends _$MainAppStateCopyWithImpl<$Res, _$MainAppStateErrorImpl>
    implements _$$MainAppStateErrorImplCopyWith<$Res> {
  __$$MainAppStateErrorImplCopyWithImpl(_$MainAppStateErrorImpl _value,
      $Res Function(_$MainAppStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MainAppStateErrorImpl extends _MainAppStateError
    with DiagnosticableTreeMixin {
  _$MainAppStateErrorImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MainAppState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MainAppStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppConfig appConfig,
            SharedPreferences sharedPreferences, PackageInfo packageInfo)
        success,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppConfig appConfig, SharedPreferences sharedPreferences,
            PackageInfo packageInfo)?
        success,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainAppStateSuccess value) success,
    required TResult Function(_MainAppStateLoading value) loading,
    required TResult Function(_MainAppStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainAppStateSuccess value)? success,
    TResult? Function(_MainAppStateLoading value)? loading,
    TResult? Function(_MainAppStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainAppStateSuccess value)? success,
    TResult Function(_MainAppStateLoading value)? loading,
    TResult Function(_MainAppStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _MainAppStateError extends MainAppState {
  factory _MainAppStateError() = _$MainAppStateErrorImpl;
  _MainAppStateError._() : super._();
}
