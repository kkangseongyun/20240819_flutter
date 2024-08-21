import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/image_widget.dart';
import 'widgets/icon_widget.dart';
import 'widgets/content_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        //flutter 로 화면 구성, 가로방향 세로방향으로 화면을 벗어나게 되면
        //노랑-검정, 경고 패턴이 자동으로.. 스크롤 신경써야 하는거 아니니???
        //스크롤 -
        //SingleChildScrollView - 하위에 단일 위젯, 그 위젯을 스크롤
        //ListView - 여러 위젯을 같이 스크롤..
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              ImageWidget(),
              IconWidget(),
              ContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

