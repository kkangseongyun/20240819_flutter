import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.pink,
            ),
            Align(
              alignment: Alignment(0.0, 0.0),//center
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/lab_lotte_1.jpg', width: 350,),
                      Container(
                        width: 350,
                        height: 100,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

