import 'package:moor_flutter/moor_flutter.dart';

part 'todo_database.g.dart';

class ToDo extends Table{

  DateTimeColumn get id => dateTime().nullable()();

  TextColumn get title => text().withLength(min: 1, max: 50)();

  TextColumn get description => text().withLength(min: 1, max: 255)();

  TextColumn get time => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [ToDo])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(FlutterQueryExecutor(path: 'todoList.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<ToDoData>> getAllTodos() => select(toDo).get();

  Stream<List<ToDoData>> watchAllTodos() => select(toDo).watch();

  Future insertTodo(ToDoData todo) {
    print('working');
    return into(toDo).insert(todo);
  }

  Future updateTodo(ToDoData todo) => update(toDo).replace(todo);

  Future deleteTodo(ToDoData todo) => delete(toDo).delete(todo);


}