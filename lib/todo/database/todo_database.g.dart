// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ToDoData extends DataClass implements Insertable<ToDoData> {
  final DateTime? id;
  final String title;
  final String description;
  final String time;
  ToDoData(
      {this.id,
      required this.title,
      required this.description,
      required this.time});
  factory ToDoData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ToDoData(
      id: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<DateTime?>(id);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['time'] = Variable<String>(time);
    return map;
  }

  ToDoCompanion toCompanion(bool nullToAbsent) {
    return ToDoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      description: Value(description),
      time: Value(time),
    );
  }

  factory ToDoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoData(
      id: serializer.fromJson<DateTime?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      time: serializer.fromJson<String>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<DateTime?>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'time': serializer.toJson<String>(time),
    };
  }

  ToDoData copyWith(
          {DateTime? id, String? title, String? description, String? time}) =>
      ToDoData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(description.hashCode, time.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.time == this.time);
}

class ToDoCompanion extends UpdateCompanion<ToDoData> {
  final Value<DateTime?> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> time;
  const ToDoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.time = const Value.absent(),
  });
  ToDoCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String time,
  })  : title = Value(title),
        description = Value(description),
        time = Value(time);
  static Insertable<ToDoData> custom({
    Expression<DateTime?>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (time != null) 'time': time,
    });
  }

  ToDoCompanion copyWith(
      {Value<DateTime?>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? time}) {
    return ToDoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<DateTime?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $ToDoTable extends ToDo with TableInfo<$ToDoTable, ToDoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ToDoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<DateTime?> id = GeneratedColumn<DateTime?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<String?> time = GeneratedColumn<String?>(
      'time', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, description, time];
  @override
  String get aliasedName => _alias ?? 'to_do';
  @override
  String get actualTableName => 'to_do';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoData> instance,
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
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ToDoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ToDoTable createAlias(String alias) {
    return $ToDoTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ToDoTable toDo = $ToDoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDo];
}
