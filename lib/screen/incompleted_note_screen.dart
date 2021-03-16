import 'package:flutter/material.dart';
import 'package:todolist/model/item.dart';

class IncompletedNoteScreen extends StatefulWidget {

  final List<Item> items;
  IncompletedNoteScreen ({Key key, @required this.items}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _IncompletedNoteScreenState(items);
}

class _IncompletedNoteScreenState extends State<IncompletedNoteScreen> {
  List<Item> items;
  _IncompletedNoteScreenState(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...items.where((element) {
          return !element.value;}).map(buildCheckboxListTile).toList()
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








