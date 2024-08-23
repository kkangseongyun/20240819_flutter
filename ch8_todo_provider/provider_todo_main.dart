import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/todos_model.dart';
import 'screens/home_screen.dart';



void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //add.................................
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
        create: (context) => TodosModel(),
        child: MaterialApp(
          theme: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(primary: Colors.blue, secondary: Colors.red)
          ),
          home: HomeScreen(),
        ),
    );
  }
}