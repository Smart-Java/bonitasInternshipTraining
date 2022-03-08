import 'package:flutter/material.dart';

class TodoSaveListWidget extends StatelessWidget {
  final List<Map>? list;
  const TodoSaveListWidget({ Key? key, this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list?.length != 0 ? ListView.builder(
      itemBuilder: (context, index){
        return Card(
          elevation: 1.5,
          child: ListTile(
            leading: CircleAvatar(child: Text('${list![index]['time']}', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)),
            title: Text('${list![index]['title']}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            subtitle: Text('${list![index]['description']}', style: TextStyle(fontSize: 16.0),),
          ),
        );
      }, 
      itemCount: list!.length == 0 ? 0 : list!.length) : 
      Center(
        child: Text('No TODO Saved', 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      );
  }
}