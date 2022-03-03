import 'package:flutter/material.dart';
import 'package:list_item_cart/stateManagement/placholder_list.dart';
import 'package:list_item_cart/widgets/placeholder_widget.dart';

class PlaceHolderPage extends StatelessWidget {
  const PlaceHolderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placholderData = new PlaceholderListBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('JSONPlacholder TODO List', style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: placholderData.getList(),
        builder: (context, AsyncSnapshot snapShot){
          if (snapShot.connectionState == ConnectionState.done) {
            if (snapShot.hasData == true) {
              return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (context, index) {
                  return PlaceholderWidget(
                    id: snapShot.data[index]['id'],
                    title: snapShot.data[index]['title'],
                    isCompleted: snapShot.data[index]['completed'],
                  );
                }
              );
            } else if (snapShot.hasError) {
              return Center(
                child: Text('Ooops, Check your internet connection...'),
              );
            } else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Center(child: CircularProgressIndicator()),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text('Please wait, loadin JSON Placeholder TODO List the data', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold),))
                ]
              );
            }
          } else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Center(child: CircularProgressIndicator()),
              SizedBox(
                height: 30,
              ),
              Center(child: Text('Please wait, loadin the JSON Placeholder TODO List data', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold),))
              ]
            );
          }
        }
      ),
    );
  }
}