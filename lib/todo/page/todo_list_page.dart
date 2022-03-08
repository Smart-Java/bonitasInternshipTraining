import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/todo/cubit/todo_list_cubit.dart';
import 'package:list_item_cart/todo/database/todo_database.dart';
import 'package:list_item_cart/todo/page/add_todo_page.dart';
import 'package:list_item_cart/todo/widget/todo_list_widget.dart';
import 'package:localstorage/localstorage.dart';

class TodoListPage extends StatefulWidget {

  const TodoListPage({ Key? key }) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  LocalStorage localStorage = new LocalStorage('todoListApp');

  List<ToDoData> todoList = [];

  var todoWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocList = BlocProvider.of<ToDoListBloc>(context);
    var list = blocList.getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List', style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        stream: list,
        builder: (context, AsyncSnapshot asyncSnapshot) {
          final data = asyncSnapshot.data;
          print('this is the list $data');

          if (data == [] || data == null) {
            return TodoListWidget(list: todoList,);
          } else{
            return TodoListWidget(list: data,);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hello fab clicked');
          Navigator.pushNamed(context, AddToDOPage.addTodoRoute);
        }, 
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}