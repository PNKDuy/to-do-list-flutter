import 'package:flutter/material.dart';
import 'package:todolist/screen/completed_note_screen.dart';
import 'package:todolist/screen/incompleted_note_screen.dart';
import 'package:todolist/screen/all_note_screen.dart';
import 'package:todolist/model/item.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static List<Item> items = [
    Item(content: "Tẩy trang"),
    Item(content: "Srm"),
    Item(content: "Kẻ mắt"),
    Item(content: "Toner"),
    Item(content: "Xịt khoáng")
  ];

  List<StatefulWidget> tabs = [
    All(items: items),
    CompletedNoteScreen(items: items),
    IncompletedNoteScreen(items: items)
  ];
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> createAlertDialog (BuildContext context){
    TextEditingController textEditingController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          FlatButton(onPressed: () {
            Navigator.of(context).pop(textEditingController.text.toString());          }, child: Text("Add"))
        ],
      );
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text('To do thangs',
          style: TextStyle(color: Colors.black),
          ),
          backgroundColor:  Colors.yellow[300],
        ),
        body: widget.tabs[_currentIndex],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
              createAlertDialog(context);
          }
          ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny),
          label: "Completed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny_outlined),
          label: "Incompleted",
        ),
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
