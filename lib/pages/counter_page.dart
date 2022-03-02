import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_item_cart/stateManagement/counter_bloc.dart';
import 'package:list_item_cart/widgets/counter_widget.dart';

class CounterAppPage extends StatelessWidget {
  const CounterAppPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int state = 0;
    return BlocProvider(create: (_) => CounterBloc(state), child: CounterWidget(),);
  }
}