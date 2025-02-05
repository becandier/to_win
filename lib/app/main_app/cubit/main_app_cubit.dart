// catch
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_win/app/_app.dart';
import 'package:to_win/firebase_options.dart';

part 'main_app_state.dart';

part 'main_app_cubit.freezed.dart';

class MainAppCubit extends Cubit<MainAppState> {
  MainAppCubit({
    required Flavors env,
  })  : _env = env,
        super(MainAppState.loading()) {
    init();
  }
  final Flavors _env;
  // Initialize app
  Future<void> init() async {
    try {
      emit(MainAppState.loading());
      await _servicesInit();

      final sharedPreferences = await _initSafe(
        'shared preferences',
        SharedPreferences.getInstance,
      );

      ///Firebase remote config
      final appConfigRemoteFirebase = AppConfigRemoteFirebase();
      await _initSafe(
        'firebase remote config',
        appConfigRemoteFirebase.init,
      );

      /// App configuration from remote config
      final appConfig = AppConfig(
        remoteConfig: appConfigRemoteFirebase,
        env: _env,
      );

      final packageInfo = await PackageInfo.fromPlatform();

      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        MainAppState.success(
          appConfig: appConfig,
          sharedPreferences: sharedPreferences,
          packageInfo: packageInfo,
        ),
      );
    } catch (e) {
      emit(MainAppState.error());
    }
  }

  Future<void> _servicesInit() async {
    // Initialize Firebase
    await _initSafe(
      'Firebase',
      () => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    );
    // Crashlytics error handler
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
  }
}

Future<T> _initSafe<T>(
  String name,
  Future<T> Function() initializer,
) async {
  Future<T> func() => initializer();
  try {
    final result = await func();

    return result;
  } catch (error, stack) {
    unawaited(
      FirebaseCrashlytics.instance
          .recordError(error, stack, reason: '$name initialization error'),
    );
    rethrow;
  }
}
