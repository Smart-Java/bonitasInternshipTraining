import 'package:flutter/material.dart';
import 'package:list_item_cart/pages/cart_list_item_page.dart';
import 'package:list_item_cart/pages/counter_page.dart';
import 'package:list_item_cart/pages/list_items_page.dart';
import 'package:list_item_cart/pages/placeholder_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      home: PlaceHolderPage(),
      title: 'List Cart Items',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
      ),
      routes: {
        // '/' : (context) => ListItemsPage(),
        CartListItemPage.cartListItemRoute : (context) => CartListItemPage(),
      },
    );
  }
}