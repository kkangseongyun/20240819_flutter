import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  int count = 100;
  String id = 'instagram';
  String content = '동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... 동해물과 백두산이 마르고 닳도록 하나님이 보우아사 우리나라 만세... ';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('좋아요 $count'),
        //rich - Text 위젯의 문자열 부분의 ui 를 다르게..
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: id, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: content)
            ]
          )
        ),
      ],
    );
  }
}