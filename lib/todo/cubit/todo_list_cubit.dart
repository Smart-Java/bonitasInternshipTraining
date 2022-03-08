// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/todo/database/todo_database.dart';
import 'package:list_item_cart/todo/repository/toDo_repo.dart';

class ToDoListBloc extends Cubit<List<ToDoData>>{

  ToDoRepo todoRepo = new ToDoRepo();

  ToDoListBloc(List<ToDoData> initialState) : super(initialState);

  // Stream<List<ToDoData>> watchData(){
  //   var list = todoRepo.watchData() as List<ToDoData>;

  //   emit(list);
  //   return todoRepo.watchData();
  // }

  Stream<List<ToDoData>> getData() {
    return todoRepo.watchData();
  }

  addData(DateTime id, String title, String description, String dateTime) async{
   await todoRepo.insertData(id, title, description, dateTime);
  }
}