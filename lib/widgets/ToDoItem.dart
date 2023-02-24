import 'package:flutter/material.dart';
import 'package:to_do_app/model/to%20do.dart';

class todoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleted;
  const todoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          onToDoChanged(todo);
        },
        tileColor: Colors.black12,
        leading: todo.isDone
            ? Icon(
                Icons.check_box,
                color: Colors.blue,
              )
            : Icon(Icons.check_box_outline_blank),
        title: Text(
          todo.todoText!,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete),
            iconSize: 18,
            onPressed: () {
              onDeleted(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
