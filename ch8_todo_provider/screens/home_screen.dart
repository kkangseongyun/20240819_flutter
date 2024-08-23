import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'add_screen.dart';

import '../models/todo.dart';
import '../providers/todos_model.dart';
import '../widgets/todo_list.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;
  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(this.todos,),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {//tab 화면 전환 animation

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);//animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodoScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(//tab button
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
      //add........................
      body: Consumer<TodosModel>(
          //model - 조상이 공개한 provider data
          builder: (context, model, child){
            return TabBarView(
              controller: controller,//TabBar 와 동일 controller 지정. 알아서 이벤트에 의해 화면 조정
                children: [
                  TabScreen(model.todos),
                  TabScreen(model.todos.where((todo) => !todo.completed).toList()),
                  TabScreen(model.todos.where((todo) => todo.completed).toList()),
                ]
            );
          }
      )

      
    );
  }
}
