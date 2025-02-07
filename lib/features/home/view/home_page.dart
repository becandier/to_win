import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_win/app/theme/gradient.dart';
import 'package:to_win/data/todo/_todo.dart';
import 'package:to_win/l10n/localization_extension.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradient,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              context.l10n.appTitle,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          body: CupertinoScrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: 100,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return TodoItemCard(
                  todo: Todo(
                    id: 1,
                    title: 'Позвонить Уллу Агаю',
                    description: 'Описание длинное у задачиии',
                    finishDate: DateTime.now(),
                    notificationDate: DateTime.now(),
                    repeatType: NotificationRepeatType.dayly,
                    status: index.isEven
                        ? StatusType.created
                        : StatusType.completed,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(todo.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            padding: const EdgeInsets.all(9),
            onPressed: (_) {},
            borderRadius: BorderRadius.circular(18),
            backgroundColor: Colors.black.withValues(alpha: .2),
            foregroundColor: Colors.white,
            icon: CupertinoIcons.trash,
          ),
        ],
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Icon(
                        switch (todo.status) {
                          StatusType.created => CupertinoIcons.clock,
                          StatusType.completed => CupertinoIcons.check_mark,
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Позвонить Уллу Агаю',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Описание длинное у задачиии',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('dd MMM HH:mm', 'ru_RU')
                          .format(DateTime.now()),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
