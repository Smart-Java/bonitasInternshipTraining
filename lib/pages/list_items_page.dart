import 'package:flutter/material.dart';
import 'package:list_item_cart/model/custom_list_model.dart';
import 'package:list_item_cart/pages/cart_list_item_page.dart';
import 'package:list_item_cart/widgets/list_items_widget.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({ Key? key }) : super(key: key);

  @override
  _ListItemsPageState createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {

  List<CustomListModel> listModel = [
    CustomListModel(imagePath: 'asset/images/Andriod.jpg', title: 'Apple Laptop', priceTag: '2000'),
    CustomListModel(imagePath: 'asset/images/best_study_2.jpg', title: 'Learning Guide', priceTag: '1000'),
    CustomListModel(imagePath: 'asset/images/FB_IMG_15927196053417180.jpg', title: 'Dell Desktop', priceTag: '3000'),
    CustomListModel(imagePath: 'asset/images/FB_IMG_16051043491569063.jpg', title: 'Apple Desktop', priceTag: '5000'),
    CustomListModel(imagePath: 'asset/images/FB_IMG_16051261521367117.jpg', title: 'Car', priceTag: '10000'),
    CustomListModel(imagePath: 'asset/images/FB_IMG_16053620252420521.jpg', title: 'Server', priceTag: '100000'),
    CustomListModel(imagePath: 'asset/images/FB_IMG_16075340858885096.jpg', title: 'Tony Robbins Talks', priceTag: '5000'),
  ];

  List<CustomListModel> cartListModel = [];

  int? noOfitems;

  @override
  void initState() {
    noOfitems = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Items', style: TextStyle(color: Colors.white,),), actions: [
        cartButton(
          noOfItems: '$noOfitems',
          onPressed: (){
            Navigator.pushNamed(context, CartListItemPage.cartListItemRoute, arguments: cartListModel);
          }
        ),
      ],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: listModel.length,
          itemBuilder: (context, item){
            return ListItemsWidget(
              cartColor: Colors.orange,
              imagePath: listModel[item].imagePath,
              title: listModel[item].title,
              subTitle: '\$${listModel[item].priceTag}',
              icon: Icons.shopping_cart,
              addCart: (){
                cartListModel.add(CustomListModel(
                  imagePath: listModel[item].imagePath,
                  priceTag: '\$${listModel[item].priceTag}',
                  title: listModel[item].title,
                ));
                setState(() {
                  noOfitems = noOfitems! + 1;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Stack cartButton({VoidCallback? onPressed, String? noOfItems,}) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Icons.shopping_cart)),
        Positioned(
          left: 1.0,
          right: 0.0,
          bottom: 0.0,
          // top: 1.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            elevation: 2.5,
            child: Center(child: Text(noOfItems!)),
            color: Colors.orange,
          ),
        )
      ],
      );
  }

  // Function addCart(int item){
  //   print('hello');
  //   cartListModel.add(CustomListModel(
  //     imagePath: listModel[item].imagePath,
  //     priceTag: '\$${listModel[item].priceTag}',
  //     title: listModel[item].title,
  //   ));
  //   setState(() {
  //     noOfitems = noOfitems! + 1;
  //   });
  //   return noOfitems;
  // }
}