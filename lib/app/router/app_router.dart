import 'package:auto_route/auto_route.dart';
import 'package:to_win/features/_features.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()

/// App Router for the app
class AppRouter extends RootStackRouter {
  /// App Router for the app
  AppRouter();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: MainRouterRoute.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeTab.page,
              children: [
                AutoRoute(
                  path: 'home',
                  initial: true,
                  page: HomeRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsTab.page,
              children: [
                AutoRoute(
                  path: 'settings',
                  initial: true,
                  page: HomeRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'HomeTab')

/// Home Tab Page for the app
class HomeTabPage extends AutoRouter {
  /// Home Tab Page for the app
  const HomeTabPage({super.key});
}

@RoutePage(name: 'SettingsTab')

/// Settings Tab Page for the app
class SettingsTabPage extends AutoRouter {
  /// Settings Tab Page for the app
  const SettingsTabPage({super.key});
}
