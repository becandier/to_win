part of 'main_app_cubit.dart';

@freezed
class MainAppState with _$MainAppState {
  MainAppState._();

  /// Success app with all dependencies
  factory MainAppState.success({
    required AppConfig appConfig,
    required SharedPreferences sharedPreferences,
    required PackageInfo packageInfo,
  }) = _MainAppStateSuccess;
  factory MainAppState.loading() = _MainAppStateLoading;
  factory MainAppState.error() = _MainAppStateError;
}
