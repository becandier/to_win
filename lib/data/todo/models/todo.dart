import 'package:to_win/data/todo/models/_models.dart';

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.status,
    this.description,
    this.finishDate,
    this.notificationDate,
    this.repeatType,
  });
  final int id;
  final String title;
  final String? description;
  final DateTime? finishDate;
  final DateTime? notificationDate;
  final NotificationRepeatType? repeatType;
  final StatusType status;
}
