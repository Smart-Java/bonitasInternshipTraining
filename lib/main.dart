import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/pages/cart_list_item_page.dart';
import 'package:list_item_cart/pages/counter_page.dart';
import 'package:list_item_cart/pages/list_items_page.dart';
import 'package:list_item_cart/pages/placeholder_page.dart';
import 'package:list_item_cart/todo/cubit/todo_list_cubit.dart';
import 'package:list_item_cart/todo/database/todo_database.dart';
import 'package:list_item_cart/todo/page/add_todo_page.dart';
import 'package:list_item_cart/todo/page/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ToDoData> list = [ToDoData(time: '12: 00 PM', id: DateTime.now(), title: 'Working', description: 'You get to work')];
    return BlocProvider(
      create: (_) => ToDoListBloc(list),
      child: MaterialApp(
        // initialRoute: '/',
        home: TodoListPage(),
        title: 'List Cart Items',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.purpleAccent,
        ),
        routes: {
          // '/' : (context) => ListItemsPage(),
          CartListItemPage.cartListItemRoute : (context) => CartListItemPage(),
          AddToDOPage.addTodoRoute : (context) => AddToDOPage(),
        },
      ),
    );
  }
}