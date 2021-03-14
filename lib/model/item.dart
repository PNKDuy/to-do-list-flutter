import 'package:flutter/cupertino.dart';

class Item {
  String content;
  bool value;

  Item({
   @required this.content,
   this.value = false
});
}