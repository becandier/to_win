import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'To Win 🏆';

  @override
  String get success => 'Успешно';

  @override
  String get error => 'Ошибка';

  @override
  String get loading => 'Загрузка';

  @override
  String get techWorks => 'Технические работы';

  @override
  String get techWorksDescription => 'В данный момент в приложении производятся технические работы. Приложение будет доступно после их окончания.';

  @override
  String get refresh => 'Обновить';

  @override
  String get attention => 'Внимание';

  @override
  String get close => 'Закрыть';

  @override
  String get deviceNotConnected => 'Устройство не подключено к сети. Проверьте соединение.';

  @override
  String get vpnEnabled => 'VPN включён. Это может повлиять на работу приложения.';

  @override
  String get home => 'Главная';

  @override
  String get settings => 'Настройки';
}
