part of 'app.dart';

class _SuccessApp extends StatefulWidget {
  const _SuccessApp({
    required this.appConfig,
    required this.sharedPreferences,
    required this.packageInfo,
  });
  final AppConfig appConfig;
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;

  @override
  State<_SuccessApp> createState() => _SuccessAppState();
}

class _SuccessAppState extends State<_SuccessApp> with WidgetsBindingObserver {
  // Local device
  Locale? _deviceLocale;

  // Router
  late AppRouter _router;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _deviceLocale = PlatformDispatcher.instance.locale;
    _router = AppRouter();
  }

  // Listen to locale changes
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    setState(() {
      _deviceLocale = locales?.first;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.appConfig),
        RepositoryProvider.value(value: widget.sharedPreferences),
        RepositoryProvider.value(value: widget.packageInfo),
      ],
      child: MaterialApp.router(
        routerConfig: _router.config(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _deviceLocale,
        theme: AppTheme().mainTheme,
        builder: (context, child) {
          return UpgradeAlert(
            upgrader: Upgrader(
              minAppVersion: widget.appConfig.minVersion,
            ),
            child: TechWorksWrapper(
              techWorks: widget.appConfig.techWork,
              child: ConnectivityWrapper(
                child: child ?? const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}
