import 'package:flutter/material.dart';
import 'package:to_do_app/model/to%20do.dart';
import '../widgets/ToDoItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addItemController = TextEditingController();
  final todoList = ToDo.todoList();
  List<ToDo> foundToDo = [];
  @override
  void initState() {
    // TODO: implement initState
    foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Container(
              width: 40,
              height: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/images/profile.png")),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                searchField(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          "All To Do",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0),
                        ),
                      ),
                      for (ToDo todo in foundToDo)
                        todoItem(
                          todo: todo,
                          onToDoChanged: handleToDoChange,
                          onDeleted: deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: addItemController,
                      decoration: InputDecoration(
                          hintText: 'Message here', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      addToDoItem(addItemController.text.toString());
                    },
                    child: Text('+', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 10,
                      minimumSize: Size(50, 50),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white30,
      ),
      child: TextField(
        onChanged: (val) {
          runFilter(val);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black45,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 20,
              maxWidth: 25,
            ),
            border: InputBorder.none,
            hintText: "Search"),
      ),
    );
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void addToDoItem(String todo) {
    setState(() {
      todoList
          .add(ToDo(id: DateTime.now().millisecond.toString(), todoText: todo));
    });
    addItemController.clear();
  }

  void runFilter(String enterKeyWord) {
    List<ToDo> results = [];
    if (enterKeyWord.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((element) =>
              element.todoText!.contains(enterKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      foundToDo = results;
    });
  }
}
