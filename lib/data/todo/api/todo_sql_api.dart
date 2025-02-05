import 'package:drift/drift.dart';
import 'package:to_win/data/todo/db/database.dart';
import 'package:to_win/data/todo/models/_models.dart';

part 'todo_sql_api.g.dart';

/// Абстрактный интерфейс управления todo
abstract class TodoSqlApiInterface {
  Future<List<Todo>> getTodos({StatusType? status});
  Future<List<Todo>> getTodosPaginated({
    StatusType? status,
    int limit = 20,
    int offset = 0,
  });
  Future<void> deleteTodo({required int id});
  Future<void> updateTodo({
    required int id,
    String? title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
    StatusType? status,
  });
  Future<Todo> getTodo({required int id});
  Future<Todo> createTodo({
    required String title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
  });
}

/// DAO, который использует drift для доступа к таблице Todos
@DriftAccessor(tables: [Todos])
class TodoDao extends DatabaseAccessor<MyDatabase>
    with _$TodoDaoMixin
    implements TodoSqlApiInterface {
  TodoDao(super.db);

  /// Функция для маппинга из сгенерированного класса (TodoEntity)
  ///в доменную модель Todo
  Todo _fromEntity(TodoEntity entity) {
    return Todo(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      finishDate: entity.finishDate,
      notificationDate: entity.notificationDate,
      repeatType: entity.repeatType,
      status: entity.status,
    );
  }

  @override
  Future<List<Todo>> getTodos({StatusType? status}) async {
    final query = select(todos);
    if (status != null) {
      query.where((t) => t.status.equals(status.asInt));
    }
    final result = await query.get();
    return result.map(_fromEntity).toList();
  }

  @override
  Future<List<Todo>> getTodosPaginated({
    StatusType? status,
    int limit = 20,
    int offset = 0,
  }) async {
    final query = (select(todos)..limit(limit, offset: offset));
    if (status != null) {
      query.where((t) => t.status.equals(status.asInt));
    }
    final result = await query.get();
    return result.map(_fromEntity).toList();
  }

  @override
  Future<void> deleteTodo({required int id}) async {
    await (delete(todos)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> updateTodo({
    required int id,
    String? title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
    StatusType? status,
  }) async {
    final updatedRows = TodosCompanion(
      title: title == null ? const Value.absent() : Value(title),
      description:
          description == null ? const Value.absent() : Value(description),
      finishDate: finishDate == null ? const Value.absent() : Value(finishDate),
      notificationDate: notificationDate == null
          ? const Value.absent()
          : Value(notificationDate),
      repeatType: repeatType == null ? const Value.absent() : Value(repeatType),
      status: status == null ? const Value.absent() : Value(status),
    );
    await (update(todos)..where((t) => t.id.equals(id))).write(updatedRows);
  }

  @override
  Future<Todo> getTodo({required int id}) async {
    final query = select(todos)..where((t) => t.id.equals(id));
    final result = await query.getSingle();
    return _fromEntity(result);
  }

  @override
  Future<Todo> createTodo({
    required String title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
  }) async {
    final companion = TodosCompanion(
      title: Value(title),
      description: Value(description),
      finishDate: Value(finishDate),
      notificationDate: Value(notificationDate),
      repeatType: repeatType == null ? const Value.absent() : Value(repeatType),
    );
    final id = await into(todos).insert(companion);
    return getTodo(id: id);
  }
}
