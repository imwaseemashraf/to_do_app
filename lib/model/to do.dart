import 'package:to_do_app/widgets/ToDoItem.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(id: "1", todoText: "Waseem", isDone: true),
      ToDo(id: "2", todoText: "usman", isDone: true),
      ToDo(id: "3", todoText: "abdullah"),
      ToDo(id: "4", todoText: "abdul manan"),
      ToDo(id: "5", todoText: "umar"),
      ToDo(id: "6", todoText: "nouman"),
      ToDo(id: "7", todoText: "shamsul haq"),
      ToDo(id: "8", todoText: "adil"),
      ToDo(id: "9", todoText: "Wasim"),
    ];
  }
}
