import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //app을 구성하는 위젯의 tree 최 상위를 꼭 MaterialApp 으로 해야 하는 것은 아니다..
    //theme 설정, navigation 처리등 앱을 위한 많은 도움을 주어서, 거의 대부분 root wiget 을 materialapp 으로..
    return MaterialApp(
      //화면의 기본 틀 제공...
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Test'),
        ),
        body: Center(
          child: Column(
            children: [
              MyStatelessWidget(),
              MyStatefulWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  //stateless widget이다.. 얼마든지 변수 선언하고.. 함수 선언해서.. 변수 값을 변경할 수 있다..
  //단... 변수 값이 변경이 된다고 하더라도 화면 re-rendering 은 되지 않는다..
  //즉 이 변수는 상태가 아니다..
  bool favorited = false;
  int favoriteCount = 10;
  void toggleFavorite() {
    print('stateless... toggleFavorite');
    if(favorited){
      favoriteCount -= 1;
      favorited = false;
    }else {
      favoriteCount += 1;
      favorited = true;
    }
  }

  //이 위젯으로 화면을 구성할때 자동 호출..
  //이 함수에서 리턴시킨 내용이 이 위젯의 화면..
  @override
  Widget build(BuildContext context) {
    print('stateless build....');
    return Row(
      children: [
        IconButton(
            onPressed: toggleFavorite,
            icon: (favorited ? Icon(Icons.star): Icon(Icons.star_border)),
            color: Colors.red,
        ),
        Container(
          child: Text('$favoriteCount'),
        )
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //statefulwidget 은 꼭 이 위젯과 매핑되는 State 객체가 있어야 한다..
    //State 객체를 생성해서 리턴..
    return MyState();
  }
}
//State 를 상속받아서 작성하면서 제네릭 타입으로 어느 Widget 의 State 라는 것 명시...
//statefulwidget 으로 만들면.. 변수 선언, 화면 구성, 데이터 변경등 대부분의 로직은 state 에 구현
class MyState extends State<MyStatefulWidget>{
  bool favorited = false;
  int favoriteCount = 10;
  void toggleFavorite() {
    print('stateful... toggleFavorite');
    //State 는 상태를 가질수 있고, 상태 값이 변경되면 화면 re-rendering 가능하지만..
    //단순 값 변경으로는 안되고.. setState() 로 변경해야..
    setState(() {
      if(favorited){
        favoriteCount -= 1;
        favorited = false;
      }else {
        favoriteCount += 1;
        favorited = true;
      }
    });

  }

  //이 위젯으로 화면을 구성할때 자동 호출..
  //이 함수에서 리턴시킨 내용이 이 위젯의 화면..
  @override
  Widget build(BuildContext context) {
    print('stateful build....');
    return Row(
      children: [
        IconButton(
          onPressed: toggleFavorite,
          icon: (favorited ? Icon(Icons.star): Icon(Icons.star_border)),
          color: Colors.red,
        ),
        Container(
          child: Text('$favoriteCount'),
        )
      ],
    );
  }
}