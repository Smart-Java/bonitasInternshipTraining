import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/todo/cubit/todo_list_cubit.dart';

class AddToDOWidget extends StatelessWidget {
  final TextEditingController? titleEditingController;
  final TextEditingController? descriptionEditingController;
  final TextEditingController? timeEditingController;
  final id; 
  final time;


  final FocusNode? titleFocusNode;
  final FocusNode? descriptionFocusNode;

  final VoidCallback? reset; 

  const AddToDOWidget({ Key? key, DateTime? this.id, String? this.time, this.descriptionEditingController, this.timeEditingController, this.titleEditingController, this.descriptionFocusNode, this.titleFocusNode, this.reset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Coding',
                suffixIcon: Icon(Icons.title),
              ),
              controller: titleEditingController,
              textInputAction: TextInputAction.next,
              focusNode: titleFocusNode,
              keyboardType: TextInputType.text,
              onSubmitted: (value){
                FocusScope.of(context).requestFocus(descriptionFocusNode);
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'The login business logic implementation',
                suffixIcon: Icon(Icons.description),
              ),
              controller: descriptionEditingController,
              textInputAction: TextInputAction.next,
              focusNode: descriptionFocusNode,
              keyboardType: TextInputType.text,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async{
                  if(descriptionEditingController!.text.isNotEmpty && titleEditingController!.text.isNotEmpty){
                    final listData = BlocProvider.of<ToDoListBloc>(context);
                    listData.addData(id, titleEditingController!.text, descriptionEditingController!.text, time);
                    Navigator.pop(context);
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('One of the field is empty, dear'), backgroundColor: Theme.of(context).primaryColor, action: SnackBarAction(label: 'OKAY', onPressed: (){}, textColor: Colors.white,),));
                    print('wrong');
                  }
                }, 
                child: Text('SET TODO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
              ),
            ],
          )
        ],
      ),
    );
  }
}