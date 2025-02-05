import 'package:to_win/app/config/_config.dart';

class AppConfig {
  AppConfig({
    required AppConfigRemote remoteConfig,
    required this.env,
  }) : _remoteConfig = remoteConfig {
    _init();
  }

  /// Апи для получения доступа к удалленному конфигу
  final AppConfigRemote _remoteConfig;
  final Flavors env;

  void _init() {
    final isProd = env == Flavors.prod;
    apiEndPoint = isProd
        ? _getString('API_ENDPOINT_PROD')
        : _getString('API_ENDPOINT_DEV');
    privacyPolicy = _getString('PRIVACY_POLICY');
    minVersion = _getString('MIN_VERSION');
    techWork = _getBool('TECH_WORK');
  }

  late final String apiEndPoint;
  late final String privacyPolicy;
  late final String minVersion;
  late final bool techWork;

  String _getString(String key) {
    final value = _remoteConfig.getString(key);
    return value;
  }

  bool _getBool(String key) => _remoteConfig.getBool(key);
  // int _getInt(String key) => _remoteConfig.getInt(key);
}
