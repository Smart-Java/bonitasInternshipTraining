// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_item_cart/todo/widget/add_todo_widget.dart';
// import 'package:localstorage/localstorage.dart';

class AddToDOPage extends StatefulWidget {
  static const addTodoRoute = '/addToRoute';

  const AddToDOPage({ Key? key }) : super(key: key);

  @override
  _AddToDOPageState createState() => _AddToDOPageState();
}

class _AddToDOPageState extends State<AddToDOPage> {

  final titleController  = new TextEditingController();
  final descriptionController  = new TextEditingController();
  final timeController  = new TextEditingController();


  final titleFocusNode = new FocusNode();
  final descriptionFocusNode = new FocusNode();

  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var timeHour = timeOfDay.hour.toString();
    var timeMin = timeOfDay.minute.toString();
    var time = '$timeHour:$timeMin';
    print(time);

    var id = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add TODO', style: TextStyle(color: Colors.white),),
      ),
      body: WillPopScope(
        onWillPop: () async{
          if(titleController.text.isEmpty || descriptionController.text.isEmpty){
            showDialog(context: context, builder: (_){
              return AlertDialog(title: Text('Confirmation'), content: Text('Are you sure you want to exit adding a new TODO?'), 
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: Text('Yes')),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('No')),
              ],);
            });
          }
          return true;
        },
        child: AddToDOWidget(
          descriptionEditingController: descriptionController,
          titleEditingController: titleController,
          titleFocusNode: titleFocusNode,
          descriptionFocusNode: descriptionFocusNode,
          id: id,
          time: time,
        ),
      ),
    );
  }
}