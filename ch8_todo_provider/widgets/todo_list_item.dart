import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8_todo_provider/providers/todos_model.dart';

import 'package:provider/provider.dart';
import '../models/todo.dart';



class TodoListItem extends StatelessWidget {
  Todo todo;

  TodoListItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          //add.....................
          //provider 의 함수 호출..
          Provider.of<TodosModel>(context, listen: false).toggleTodo(todo);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          //add.........................
          Provider.of<TodosModel>(context, listen: false).deleteTodo(todo);
        },
      ),
    );
  }
}
