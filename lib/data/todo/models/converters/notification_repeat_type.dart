import 'package:drift/drift.dart';
import 'package:to_win/data/todo/models/_models.dart';

class NotificationRepeatTypeConverter
    extends TypeConverter<NotificationRepeatType, int> {
  const NotificationRepeatTypeConverter();

  @override
  NotificationRepeatType fromSql(int fromDb) {
    return NotificationRepeatType.values[fromDb];
  }

  @override
  int toSql(NotificationRepeatType value) {
    return value.index;
  }
}
