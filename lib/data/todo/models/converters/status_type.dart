import 'package:drift/drift.dart';
import 'package:to_win/data/todo/models/_models.dart';

class StatusTypeConverter extends TypeConverter<StatusType, int> {
  const StatusTypeConverter();

  @override
  StatusType fromSql(int fromDb) {
    return StatusType.values[fromDb];
  }

  @override
  int toSql(StatusType value) {
    return value.index;
  }
}
