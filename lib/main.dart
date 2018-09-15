import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
List<String> litems = [];
bool checkboxState = false;
final TextEditingController eCtrl = new TextEditingController();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}
class ListDisplay extends StatefulWidget {
  @override
  State createState() => new toDoList();
}

class toDoList extends State<ListDisplay> {
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Just Do It !!"),),
        body: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Add to To Do List'
              ),
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new CheckboxListTile(onChanged: (bool e) => true,value: false, title: new Text(litems[Index]));
                    }
                )
            )
          ],
        )
    );
  }
}
