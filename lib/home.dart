import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [];

  TextEditingController fieldController = TextEditingController();

  void addItem() {
    setState(() {
      todoList.add(fieldController.text);
    });
    fieldController.clear();
  }

  Container buildItem(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              todoList.remove(title);
            });
          },
        ),
      ),
    );
  }

  List<Widget> getItem() {
    List<Widget> todoWidget = <Widget>[];
    for (String title in todoList) {
      todoWidget.add(buildItem(title));
    }
    return todoWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff8ABAD3FF),
        body: Column(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ListView(children: getItem()),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(color: Color(0xff8ABAD3FF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        controller: fieldController,
                        cursorColor: Colors.blueGrey,
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: addItem,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
        ]));
  }
}
