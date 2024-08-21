import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//popup menu 구성 문자열..
const List<String> choices = [
  '신고', '알림설정','공유'
];

class HeaderWidget extends StatelessWidget {
  //popup menu click event callback..
  void select(String choice){
    Fluttertoast.showToast(
        msg: choice,//화면 출력 문자열..
        toastLength: Toast.LENGTH_SHORT,//사라지는 시간..
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/lab_instagram_icon_0.jpg'),
        //화면의 특정 영역을 구성, 사이즈, 백그라운드등..
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text('instagram', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        //여백만을 차지하는 위젯.
        Spacer(),
        PopupMenuButton<String>(
            onSelected: select,//메뉴 클릭 이벤트...
            //메뉴 구성을 위해 자동 호출.. 이 함수에서 리턴되는 것으로 메뉴 구성..
            itemBuilder: (context){
              return choices.map<PopupMenuItem<String>>((String choice){
                return PopupMenuItem<String>(
                  value: choice,//메뉴 클릭시 이벤트 콜백에 전달할 매개변수 값..
                  child: Text(choice),
                );
              }).toList();
            }
        ),
      ],
    );
  }
}