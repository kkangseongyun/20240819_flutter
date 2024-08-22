import 'package:flutter/material.dart';
import 'user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //화면전환시 넘어온 데이터 추출..
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('TwoScreen'),
          ),
          body: Container(
            color: Colors.green,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TwoScreen', style: TextStyle(color: Colors.white,fontSize: 30)),
                    Text('sendData : ${args['arg1']}, ${args['arg2']}, ${(args['arg3'] as User).name}'),
                    ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/three');
                    }, child: Text('Go Three')),
                    ElevatedButton(onPressed: (){
                      //이전 화면으로 전환..
                      Navigator.pop(context, User('lee','pusan'));
                    }, child: Text('pop')),
                  ],
                )
            ),
          ),
        )
    );
  }
}