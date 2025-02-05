import 'package:drift/drift.dart';
import 'package:to_win/data/todo/models/_models.dart';

// Указываем, что drift должен генерировать класс с именем TodoEntity
@DataClassName('TodoEntity')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get finishDate => dateTime().nullable()();
  DateTimeColumn get notificationDate => dateTime().nullable()();

  // Используем type-конвертеры для хранения enum
  IntColumn get repeatType => integer()
      .map(const NotificationRepeatTypeConverter())
      .withDefault(Constant(NotificationRepeatType.none.index))();

  IntColumn get status => integer()
      .map(const StatusTypeConverter())
      .withDefault(Constant(StatusType.created.index))();
}
