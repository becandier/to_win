import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_win/l10n/localization_extension.dart';

@RoutePage()
class MainRouterPage extends StatelessWidget {
  const MainRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      duration: Duration.zero,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          // bottomNavigationBar: NavigationBar(
          //   backgroundColor: Colors.indigo,
          //   height: 65,
          //   selectedIndex: tabsRouter.activeIndex,
          //   onDestinationSelected: tabsRouter.setActiveIndex,
          //   destinations: [
          //     NavigationDestination(
          //       icon: const Icon(Icons.home),
          //       label: context.l10n.home,
          //     ),
          //     NavigationDestination(
          //       icon: const Icon(Icons.settings),
          //       label: context.l10n.settings,
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}
