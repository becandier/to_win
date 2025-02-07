import 'package:to_win/data/todo/_todo.dart';

/// Репозиторий для работы с todo
class TodoRepository implements TodoSqlApiInterface {
  /// Конструктор принимает экземпляр TodoDao (например, через DI)
  TodoRepository(this._dao);
  final TodoDao _dao;

  @override
  Future<List<Todo>> getTodos({StatusType? status}) {
    return _dao.getTodos(status: status);
  }

  @override
  Future<List<Todo>> getTodosPaginated({
    StatusType? status,
    int limit = 20,
    int offset = 0,
  }) {
    return _dao.getTodosPaginated(status: status, limit: limit, offset: offset);
  }

  @override
  Future<void> deleteTodo({required int id}) {
    return _dao.deleteTodo(id: id);
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
  }) {
    return _dao.updateTodo(
      id: id,
      title: title,
      description: description,
      finishDate: finishDate,
      notificationDate: notificationDate,
      repeatType: repeatType,
      status: status,
    );
  }

  @override
  Future<Todo> getTodo({required int id}) {
    return _dao.getTodo(id: id);
  }

  @override
  Future<Todo> createTodo({
    required String title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
  }) {
    return _dao.createTodo(
      title: title,
      description: description,
      finishDate: finishDate,
      notificationDate: notificationDate,
      repeatType: repeatType,
    );
  }
}
