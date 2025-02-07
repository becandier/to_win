import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:to_win/data/todo/models/notification_repeat_type.dart';

class LocalNotificationService {
  factory LocalNotificationService() => _instance;

  LocalNotificationService._internal();
  // Синглтон для удобства использования сервиса по всему приложению
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Инициализация плагина и временных зон
  Future<void> init() async {
    tz.initializeTimeZones();

    // Настройки для Android
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Настройки для iOS
    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Метод для создания запланированного уведомления
  /// [id] – идентификатор уведомления (важен для последующего обновления/удаления)
  /// [title] – заголовок уведомления
  /// [body] – текст уведомления (описание)
  /// [scheduledDate] – дата и время, когда должно сработать уведомление
  /// [repeatType] – период повторения уведомления
  /// (none, dayly, weekly, monthly)
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationRepeatType repeatType,
  }) async {
    // Преобразуем дату в tz.TZDateTime с учетом локальной временной зоны
    final scheduledTZDate = tz.TZDateTime.from(scheduledDate, tz.local);

    const androidDetails = AndroidNotificationDetails(
      'todo_channel',
      'Todo Notifications',
      channelDescription: 'Уведомления для напоминаний по задачам',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Определяем компоненты времени для повторяющихся уведомлений
    DateTimeComponents? matchDateTimeComponents;
    switch (repeatType) {
      case NotificationRepeatType.none:
        matchDateTimeComponents = null;
      case NotificationRepeatType.dayly:
        matchDateTimeComponents = DateTimeComponents.time;
      case NotificationRepeatType.weekly:
        matchDateTimeComponents = DateTimeComponents.dayOfWeekAndTime;
      case NotificationRepeatType.monthly:
        matchDateTimeComponents = DateTimeComponents.dayOfMonthAndTime;
    }

    if (matchDateTimeComponents == null) {
      // Однократное уведомление
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTZDate,
        platformDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
      );
    } else {
      // Повторяющееся уведомление
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTZDate,
        platformDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
        matchDateTimeComponents: matchDateTimeComponents,
      );
    }
  }

  /// Метод для отмены уведомления по id
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
