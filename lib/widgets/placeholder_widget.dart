import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final int? id;
  final String? title;
  final bool? isCompleted;
  const PlaceholderWidget({ Key? key, this.title, this.id, this.isCompleted}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$id', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
      title: Text('$title', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
      trailing: Icon(isCompleted == true ? Icons.done : Icons.more_time),
    );
  }
}