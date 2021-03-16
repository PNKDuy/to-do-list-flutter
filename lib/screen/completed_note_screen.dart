import 'package:flutter/material.dart';
import 'package:todolist/model/item.dart';

class CompletedNoteScreen extends StatefulWidget {
  final List<Item> items;

  CompletedNoteScreen({Key key, @required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompletedNoteScreenState(items);
}

class _CompletedNoteScreenState extends State<CompletedNoteScreen> {
  List<Item> items;

  _CompletedNoteScreenState(this.items);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        ...items.where((element) {
          return element.value;}).map(buildCheckboxListTile).toList()
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
