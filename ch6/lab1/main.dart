import 'package:flutter/material.dart';
import 'four_screen.dart';
import 'one_screen.dart';
import 'three_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
      },
      //name 과 argument 정보를 보면서 동적으로 제어해야 하는 경우..
      //어디선가 pushNamed() 가 호출이 될때 마다 호출.. 매개변수에 정보포함..
      onGenerateRoute: (settings){
        if(settings.name == '/three'){
          //적절한 판단한후에.. route 객체를 리턴시키면 그 객체 정보로 화면 전환..
          return MaterialPageRoute(
              builder: (context) => ThreeScreen(),
              settings: settings
          );
        }else if(settings.name == '/four'){
          return MaterialPageRoute(
              builder: (context) => FourScreen(),
              settings: settings
          );
        }
      },
    );
  }
}