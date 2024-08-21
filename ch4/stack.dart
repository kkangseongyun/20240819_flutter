import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//각 화면 데이터 추상화..
class DataVO {
  String image;
  String title;
  String date;
  String content;
  String location;
  DataVO(this.image, this.title, this.date, this.content, this.location);
}

List<DataVO> datas = [
  DataVO('images/lab_lotte_1.jpg', '롯데웨딩위크', '각 지점 본 매장', '2.14(금) ~ 2.23(일)',
      '백화점 전점'),
  DataVO('images/lab_lotte_2.jpg', 'LG TROMM 스타일러', '각 지점 본 매장',
      '2.14(금) ~ 2.29(토)', '백화점 전점'),
  DataVO(
      'images/lab_lotte_3.jpg', '금양와인 페스티발', '본매장', '2.15(토) ~ 2.20(목)', '잠실점'),
  DataVO('images/lab_lotte_4.jpg', '써스데이 아일랜드', '본 매장', '2.17(월) ~ 2.23(일)',
      '잠실점'),
  DataVO('images/lab_lotte_5.jpg', '듀풍클래식', '본 매장', '2.21(금) ~ 3.8(일)', '잠실점'),
];

//이벤트 카드 하나를 위한 위젯..
class CardADWidget extends StatelessWidget {
  DataVO vo;
  CardADWidget(this.vo);
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  Image.asset(vo.image, width: 350,),
                  Container(
                    width: 350,
                    height: 100,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vo.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text(vo.content),
                        Text(vo.date),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 30,
                bottom: 90,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text(vo.location, style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//PageView - 손가락 따라서 순서대로 화면 출력..
class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}
class MyWidgetState extends State<MyWidget> {
  //데이터 갯수 만큼 위젯을 생성해서 List 로 반환하는 개발자 함수..
  List<CardADWidget> makeWidgets(){
    return datas.map((vo){
      return CardADWidget(vo);
    }).toList();
  }
  //pageview 제어자..
  PageController controller = PageController(
    initialPage: 0,
    //0~1.0 사이의 숫자..
    //현재의 화면 좌우에 이전, 이후 화면이 얼마나 나와야 하는지..
    //1.0 이면.. 이전 이후 화면 출력 안되고..
    viewportFraction: 0.9,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: PageView(
              controller: controller,
              children: makeWidgets(),
            ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 5,
          effect: WormEffect(
            dotColor: Colors.white,
            activeDotColor: Colors.indigo,
          ),
        ),
        SizedBox(height: 32.0,)
      ],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        //디바이스의 자체 특징에 의해 앱의 화면이 정상적으로 나오기 힘들때.. 노치, 시스템바등..
        //SafeArea 를 이용하면 디바이스에서 최대한 앱의 화면을 보호해서.. 정상적으로 나오게 처리..
        body: SafeArea(
            child: Container(
              color: Colors.pink,
              child: MyWidget(),
            )
        ),
      ),
    );
  }
}

