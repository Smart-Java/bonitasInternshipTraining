import 'package:flutter/material.dart';
import 'package:list_item_cart/model/custom_list_model.dart';
import 'package:list_item_cart/widgets/list_items_widget.dart';

class CartListItemPage extends StatefulWidget {
  static const cartListItemRoute = '/cartListItemRoute';
  const CartListItemPage({ Key? key }) : super(key: key);

  @override
  _CartListItemPageState createState() => _CartListItemPageState();
}

class _CartListItemPageState extends State<CartListItemPage> {
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)!.settings.arguments as List<CustomListModel>;
    print(routeData.length);
    return Scaffold(
      appBar: AppBar(title: Text('Cart List Items', style: TextStyle(color: Colors.white,),),),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: routeData.length == 0 ? Center(
              child: Text('No item added in the cart'),
            ) : ListView.builder(
          itemCount: routeData.length,
          itemBuilder: (context, item){
            return ListItemsWidget(
              cartColor: Colors.orange,
              imagePath: routeData[item].imagePath,
              title: routeData[item].title,
              subTitle: routeData[item].priceTag,
              icon: Icons.check_outlined,
              addCart: (){},
            );
          },
      ),
       ),
    );
  }
}