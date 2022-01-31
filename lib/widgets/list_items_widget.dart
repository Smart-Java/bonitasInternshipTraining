import 'package:flutter/material.dart';
import 'package:list_item_cart/model/custom_list_model.dart';

class ListItemsWidget extends StatefulWidget {
  final String? title;
  final String? imagePath;
  final VoidCallback? addCart;
  final Color? cartColor;
  final String? subTitle;
  final IconData? icon;

  const ListItemsWidget({ Key? key, this.addCart, this.imagePath, this.title, this.cartColor, this.subTitle, this.icon}) : super(key: key);

  @override
  _ListItemsWidgetState createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('${widget.imagePath!}'),
      ),
      title: Text(widget.title!),
      subtitle: Text(widget.subTitle!),
      trailing: IconButton(onPressed: widget.addCart, icon: Icon(widget.icon, color: widget.cartColor,)),
    );
  }
  void add(int item, int? noOfitems, {List<CustomListModel>? cartListModel, List<CustomListModel>? listModel,}){
    print('hello');
    cartListModel!.add(CustomListModel(
      imagePath: listModel![item].imagePath,
      priceTag: '\$${listModel[item].priceTag}',
      title: listModel[item].title,
    ));
    setState(() {
      noOfitems = noOfitems! + 1;
    });
  }
}