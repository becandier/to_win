import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_win/app/_app.dart';
import 'package:to_win/app/main_app/cubit/_cubit.dart';
import 'package:to_win/build_gen/assets.gen.dart';
import 'package:to_win/features/_features.dart';
import 'package:to_win/l10n/_l10n.dart';
import 'package:upgrader/upgrader.dart';

part 'error_app.dart';
part 'loading_app.dart';
part 'success_app.dart';

class App extends StatelessWidget {
  const App({
    required this.flavor,
    super.key,
  });

  final Flavors flavor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainAppCubit(
        env: flavor,
      ),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAppCubit, MainAppState>(
      builder: (context, state) {
        return state.when(
          success: (
            AppConfig appConfig,
            SharedPreferences sharedPreferences,
            PackageInfo packageInfo,
          ) =>
              _SuccessApp(
            appConfig: appConfig,
            sharedPreferences: sharedPreferences,
            packageInfo: packageInfo,
          ),
          loading: () => const _LoadingApp(),
          error: () => const _ErrorApp(),
        );
      },
    );
  }
}
