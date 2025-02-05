import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:to_win/data/todo/api/todo_sql_api.dart';
import 'package:to_win/data/todo/models/_models.dart';

part 'database.g.dart'; // Сгенерированный код drift

// Реализация вашей базы данных, в которую включена таблица Todos и DAO
@DriftDatabase(tables: [Todos], daos: [TodoDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

// Функция для открытия подключения к БД
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todos.sqlite'));
    return NativeDatabase(file);
  });
}
