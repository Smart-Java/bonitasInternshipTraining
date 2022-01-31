import 'package:flutter/cupertino.dart';

class CustomListModel{
  final String? imagePath;
  final String? title;
  final priceTag;

  CustomListModel({
    @required this.imagePath,
    @required this.title,
    String? this.priceTag,
  });
}