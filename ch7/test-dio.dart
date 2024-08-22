import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //서버에서 획득한 목록 구성 데이터..
  List datas = [];

  //ListView 에 등록해 ListView 의 스크롤 정보를 활용, 페이징 개념 적용 위해서..
  ScrollController controller = ScrollController();

  int page = 1;
  int seed = 1;

  //서버 요청을 위한 개발자 함수..
  //Future - 미래 데이터, List<> - 미래에 발생하는 구체적인 데이터..
  //함수의 리턴 타입이 Future 이면.. 이 함수를 호출한 곳이 대기하지 않는다.. 함수는 async 로 선언
  Future<List<dynamic>> dioTest() async {
    try {
      //dio 객체 생성... 기본 옵션 설정해서..
      var dio = Dio(BaseOptions(
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        }
      ));

      //서버 요청 순간..
      Response<dynamic> response = await dio.get(
        'https://randomuser.me/api/?seed=$seed&page=$page&results=20'
      );
      return response.data['results'];//서버에서 넘어온 json 데이터의 key
    }catch(e){
      print(e);
    }
    return [];
  }

  //앱이 실행되자 마자 최초 데이터 요청, 출력..
  @override
  void initState() {
    super.initState();
    //ListView 의 스크롤 정보, 이벤트 등록..
    controller.addListener(scrollListener);
    //초기 데이터 획득
    dioTest().then((value){
      //화면 갱신
      setState(() {
        datas = value;
      });
    });
  }
  //스크롤 이벤트 콜백..
  scrollListener() async {
    //마지막까지 스크롤 된것인지 판단..
    if(controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange){
      page++;
      List result = await dioTest();
      setState(() {
        datas.addAll(result);
      });
    }
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  //refresh 상황에서 호출될 개발자 함수..
  Future<void> refresh() async {
    page = 1;
    seed++;
    List result = await dioTest();
    setState(() {
      datas = result;
    });
  }
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.separated(
            controller: controller,
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(
                    "${datas[position]["name"]["first"]} ${datas[position]["name"]["last"]}"),
                subtitle: Text(datas[position]["email"]),
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child:
                        Image.network(datas[position]["picture"]['thumbnail']),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int position) {
              return Divider(
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}
