import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/stateManagement/counter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (context, state){
                return Text('$state',  
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                );
              }
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(onPressed: (){
                  counterBloc.increment();
                }, child: Text('+', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0,)),),
                FloatingActionButton(onPressed: (){
                  counterBloc.decrement();
                }, child: Text('-', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0,)),),
              ]
            )
          ]
        ),
      ),
    );
  }
}