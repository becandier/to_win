// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, TodoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _finishDateMeta =
      const VerificationMeta('finishDate');
  @override
  late final GeneratedColumn<DateTime> finishDate = GeneratedColumn<DateTime>(
      'finish_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notificationDateMeta =
      const VerificationMeta('notificationDate');
  @override
  late final GeneratedColumn<DateTime> notificationDate =
      GeneratedColumn<DateTime>('notification_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _repeatTypeMeta =
      const VerificationMeta('repeatType');
  @override
  late final GeneratedColumnWithTypeConverter<NotificationRepeatType, int>
      repeatType = GeneratedColumn<int>('repeat_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(NotificationRepeatType.none.index))
          .withConverter<NotificationRepeatType>(
              $TodosTable.$converterrepeatType);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<StatusType, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(StatusType.created.index))
          .withConverter<StatusType>($TodosTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        finishDate,
        notificationDate,
        repeatType,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<TodoEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date']!, _finishDateMeta));
    }
    if (data.containsKey('notification_date')) {
      context.handle(
          _notificationDateMeta,
          notificationDate.isAcceptableOrUnknown(
              data['notification_date']!, _notificationDateMeta));
    }
    context.handle(_repeatTypeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      finishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_date']),
      notificationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}notification_date']),
      repeatType: $TodosTable.$converterrepeatType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repeat_type'])!),
      status: $TodosTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }

  static TypeConverter<NotificationRepeatType, int> $converterrepeatType =
      const NotificationRepeatTypeConverter();
  static TypeConverter<StatusType, int> $converterstatus =
      const StatusTypeConverter();
}

class TodoEntity extends DataClass implements Insertable<TodoEntity> {
  final int id;
  final String title;
  final String? description;
  final DateTime? finishDate;
  final DateTime? notificationDate;
  final NotificationRepeatType repeatType;
  final StatusType status;
  const TodoEntity(
      {required this.id,
      required this.title,
      this.description,
      this.finishDate,
      this.notificationDate,
      required this.repeatType,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || finishDate != null) {
      map['finish_date'] = Variable<DateTime>(finishDate);
    }
    if (!nullToAbsent || notificationDate != null) {
      map['notification_date'] = Variable<DateTime>(notificationDate);
    }
    {
      map['repeat_type'] =
          Variable<int>($TodosTable.$converterrepeatType.toSql(repeatType));
    }
    {
      map['status'] = Variable<int>($TodosTable.$converterstatus.toSql(status));
    }
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      finishDate: finishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(finishDate),
      notificationDate: notificationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationDate),
      repeatType: Value(repeatType),
      status: Value(status),
    );
  }

  factory TodoEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoEntity(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      finishDate: serializer.fromJson<DateTime?>(json['finishDate']),
      notificationDate:
          serializer.fromJson<DateTime?>(json['notificationDate']),
      repeatType:
          serializer.fromJson<NotificationRepeatType>(json['repeatType']),
      status: serializer.fromJson<StatusType>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'finishDate': serializer.toJson<DateTime?>(finishDate),
      'notificationDate': serializer.toJson<DateTime?>(notificationDate),
      'repeatType': serializer.toJson<NotificationRepeatType>(repeatType),
      'status': serializer.toJson<StatusType>(status),
    };
  }

  TodoEntity copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<DateTime?> finishDate = const Value.absent(),
          Value<DateTime?> notificationDate = const Value.absent(),
          NotificationRepeatType? repeatType,
          StatusType? status}) =>
      TodoEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        finishDate: finishDate.present ? finishDate.value : this.finishDate,
        notificationDate: notificationDate.present
            ? notificationDate.value
            : this.notificationDate,
        repeatType: repeatType ?? this.repeatType,
        status: status ?? this.status,
      );
  TodoEntity copyWithCompanion(TodosCompanion data) {
    return TodoEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      finishDate:
          data.finishDate.present ? data.finishDate.value : this.finishDate,
      notificationDate: data.notificationDate.present
          ? data.notificationDate.value
          : this.notificationDate,
      repeatType:
          data.repeatType.present ? data.repeatType.value : this.repeatType,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('finishDate: $finishDate, ')
          ..write('notificationDate: $notificationDate, ')
          ..write('repeatType: $repeatType, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, finishDate, notificationDate, repeatType, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.finishDate == this.finishDate &&
          other.notificationDate == this.notificationDate &&
          other.repeatType == this.repeatType &&
          other.status == this.status);
}

class TodosCompanion extends UpdateCompanion<TodoEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> finishDate;
  final Value<DateTime?> notificationDate;
  final Value<NotificationRepeatType> repeatType;
  final Value<StatusType> status;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.notificationDate = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.status = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.notificationDate = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.status = const Value.absent(),
  }) : title = Value(title);
  static Insertable<TodoEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? finishDate,
    Expression<DateTime>? notificationDate,
    Expression<int>? repeatType,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (finishDate != null) 'finish_date': finishDate,
      if (notificationDate != null) 'notification_date': notificationDate,
      if (repeatType != null) 'repeat_type': repeatType,
      if (status != null) 'status': status,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime?>? finishDate,
      Value<DateTime?>? notificationDate,
      Value<NotificationRepeatType>? repeatType,
      Value<StatusType>? status}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      finishDate: finishDate ?? this.finishDate,
      notificationDate: notificationDate ?? this.notificationDate,
      repeatType: repeatType ?? this.repeatType,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<DateTime>(finishDate.value);
    }
    if (notificationDate.present) {
      map['notification_date'] = Variable<DateTime>(notificationDate.value);
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<int>(
          $TodosTable.$converterrepeatType.toSql(repeatType.value));
    }
    if (status.present) {
      map['status'] =
          Variable<int>($TodosTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('finishDate: $finishDate, ')
          ..write('notificationDate: $notificationDate, ')
          ..write('repeatType: $repeatType, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $TodosTable todos = $TodosTable(this);
  late final TodoDao todoDao = TodoDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}

typedef $$TodosTableCreateCompanionBuilder = TodosCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  Value<DateTime?> finishDate,
  Value<DateTime?> notificationDate,
  Value<NotificationRepeatType> repeatType,
  Value<StatusType> status,
});
typedef $$TodosTableUpdateCompanionBuilder = TodosCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<DateTime?> finishDate,
  Value<DateTime?> notificationDate,
  Value<NotificationRepeatType> repeatType,
  Value<StatusType> status,
});

class $$TodosTableFilterComposer extends Composer<_$MyDatabase, $TodosTable> {
  $$TodosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get notificationDate => $composableBuilder(
      column: $table.notificationDate,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<NotificationRepeatType, NotificationRepeatType,
          int>
      get repeatType => $composableBuilder(
          column: $table.repeatType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<StatusType, StatusType, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$TodosTableOrderingComposer extends Composer<_$MyDatabase, $TodosTable> {
  $$TodosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get notificationDate => $composableBuilder(
      column: $table.notificationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$TodosTableAnnotationComposer
    extends Composer<_$MyDatabase, $TodosTable> {
  $$TodosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => column);

  GeneratedColumn<DateTime> get notificationDate => $composableBuilder(
      column: $table.notificationDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<NotificationRepeatType, int>
      get repeatType => $composableBuilder(
          column: $table.repeatType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StatusType, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$TodosTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TodosTable,
    TodoEntity,
    $$TodosTableFilterComposer,
    $$TodosTableOrderingComposer,
    $$TodosTableAnnotationComposer,
    $$TodosTableCreateCompanionBuilder,
    $$TodosTableUpdateCompanionBuilder,
    (TodoEntity, BaseReferences<_$MyDatabase, $TodosTable, TodoEntity>),
    TodoEntity,
    PrefetchHooks Function()> {
  $$TodosTableTableManager(_$MyDatabase db, $TodosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> finishDate = const Value.absent(),
            Value<DateTime?> notificationDate = const Value.absent(),
            Value<NotificationRepeatType> repeatType = const Value.absent(),
            Value<StatusType> status = const Value.absent(),
          }) =>
              TodosCompanion(
            id: id,
            title: title,
            description: description,
            finishDate: finishDate,
            notificationDate: notificationDate,
            repeatType: repeatType,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime?> finishDate = const Value.absent(),
            Value<DateTime?> notificationDate = const Value.absent(),
            Value<NotificationRepeatType> repeatType = const Value.absent(),
            Value<StatusType> status = const Value.absent(),
          }) =>
              TodosCompanion.insert(
            id: id,
            title: title,
            description: description,
            finishDate: finishDate,
            notificationDate: notificationDate,
            repeatType: repeatType,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TodosTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $TodosTable,
    TodoEntity,
    $$TodosTableFilterComposer,
    $$TodosTableOrderingComposer,
    $$TodosTableAnnotationComposer,
    $$TodosTableCreateCompanionBuilder,
    $$TodosTableUpdateCompanionBuilder,
    (TodoEntity, BaseReferences<_$MyDatabase, $TodosTable, TodoEntity>),
    TodoEntity,
    PrefetchHooks Function()>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$TodosTableTableManager get todos =>
      $$TodosTableTableManager(_db, _db.todos);
}
