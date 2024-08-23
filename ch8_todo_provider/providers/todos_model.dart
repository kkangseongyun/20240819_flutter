import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8_todo_provider/models/todo.dart';

//provider 로 하위에 공개할 개발자 클래스..
//변경 감지, 자동 하위 업데이트..
class TodosModel extends ChangeNotifier {
  //이곳에 선언한 변수, 함수를 하위 누군가가 이용..
  final List<Todo> todos = [];

  void addTodo(Todo todo){
    todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo){
    final index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Todo todo){
    todos.remove(todo);
    notifyListeners();
  }
}

