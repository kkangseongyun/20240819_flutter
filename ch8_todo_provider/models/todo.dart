import 'package:flutter/material.dart';

//todo data 개발자 클래스.
class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}

