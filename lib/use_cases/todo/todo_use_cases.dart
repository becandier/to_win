import 'package:to_win/app/services/_service.dart';
import 'package:to_win/data/todo/_todo.dart';

class TodoUseCases {
  TodoUseCases({
    required TodoRepository repository,
    required LocalNotificationService notificationService,
  })  : _repository = repository,
        _notificationService = notificationService;
  final TodoRepository _repository;
  final LocalNotificationService _notificationService;

  /// Создаёт новый todo и,
  /// если задано время уведомления,
  /// планирует уведомление.
  Future<Todo> createTodo({
    required String title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
  }) async {
    // Создаём todo через репозиторий
    final todo = await _repository.createTodo(
      title: title,
      description: description,
      finishDate: finishDate,
      notificationDate: notificationDate,
      repeatType: repeatType,
    );

    // Если указана дата уведомления, планируем уведомление
    if (todo.notificationDate != null) {
      await _notificationService.scheduleNotification(
        id: todo.id,
        title: todo.title,
        body: todo.description ?? '',
        scheduledDate: todo.notificationDate!,
        repeatType: todo.repeatType ?? NotificationRepeatType.none,
      );
    }
    return todo;
  }

  /// Обновляет todo.
  /// Если статус изменился на completed, уведомление отменяется.
  /// Если обновлённое todo содержит новое время уведомления,
  /// старое уведомление отменяется,
  /// а новое планируется.
  Future<void> updateTodo({
    required int id,
    String? title,
    String? description,
    DateTime? finishDate,
    DateTime? notificationDate,
    NotificationRepeatType? repeatType,
    StatusType? status,
  }) async {
    // Выполняем обновление через репозиторий
    await _repository.updateTodo(
      id: id,
      title: title,
      description: description,
      finishDate: finishDate,
      notificationDate: notificationDate,
      repeatType: repeatType,
      status: status,
    );

    // Если статус изменился на completed, отменяем уведомление
    if (status != null && status == StatusType.completed) {
      await _notificationService.cancelNotification(id);
    } else if (notificationDate != null) {
      // Если обновлено время уведомления,
      //отменяем предыдущий план (если он был)
      // и планируем новое уведомление
      await _notificationService.cancelNotification(id);
      await _notificationService.scheduleNotification(
        id: id,
        title: title ?? '',
        body: description ?? '',
        scheduledDate: notificationDate,
        repeatType: repeatType ?? NotificationRepeatType.none,
      );
    }
  }

  /// Удаляет todo и отменяет привязанное уведомление
  /// (если оно было запланировано).
  Future<void> deleteTodo({required int id}) async {
    await _repository.deleteTodo(id: id);
    await _notificationService.cancelNotification(id);
  }

  /// Получает todo по идентификатору.
  Future<Todo> getTodo({required int id}) async {
    return _repository.getTodo(id: id);
  }

  /// Получает список todo, опционально по фильтру статуса.
  Future<List<Todo>> getTodos({StatusType? status}) async {
    return _repository.getTodos(status: status);
  }

  /// Получает список todo с пагинацией.
  Future<List<Todo>> getTodosPaginated({
    StatusType? status,
    int limit = 20,
    int offset = 0,
  }) async {
    return _repository.getTodosPaginated(
      status: status,
      limit: limit,
      offset: offset,
    );
  }
}
