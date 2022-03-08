import 'package:list_item_cart/todo/database/todo_database.dart';

class ToDoRepo {
  AppDatabase appDatabase = new AppDatabase();

  Future insertData(DateTime id, String title, String description, String dateTime) => appDatabase.insertTodo(ToDoData(id: id, title: title, description: description, time: dateTime));

  Stream<List<ToDoData>> watchData() {
    var a = appDatabase.watchAllTodos();
    return a;
  }
}