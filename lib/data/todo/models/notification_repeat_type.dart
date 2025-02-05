enum NotificationRepeatType {
  none,
  dayly,
  weekly,
  monthly,
}

extension NotificationRepeatTypeX on NotificationRepeatType {
  int get asInt => index;
}
