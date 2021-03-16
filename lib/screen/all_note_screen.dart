import 'package:flutter/material.dart';
import 'package:todolist/model/item.dart';

class All extends StatefulWidget {

  final List<Item> items;
  All ({Key key, @required this.items}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AllState(items);
}

class _AllState extends State<All> {
  List<Item> items;
  _AllState(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...items.map(buildCheckboxListTile).toList()
      ],
    );
  }



  Widget buildCheckboxListTile(Item item) {
    return CheckboxListTile(
        value: item.value,
        onChanged: (value) {
          setState(() {
            item.value = value;
          });
        },
        title: Text(item.content),
    );
  }
}








