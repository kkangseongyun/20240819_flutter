import 'package:flutter/material.dart';
import 'dart:convert';//json parsing..
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetWidget extends StatelessWidget {
  Widget makeTextAssetWidget(context){
    //Future - data - 미래에 발생하는 데이터.. 비동기
    //FutureBuilder - future data 로 화면을 구성하는  widget
    return FutureBuilder(
        //FutureBuilder 가 핸들링 해야하는 Future data 지정..
        //함수를 호출하면 바로 Future 타입이 리턴되고.. 나중에 실제 데이터가 발생했을때 그 데이터가 전달..
        future: DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt'),
        //future 에 의해 실제 데이터가 발생했을때 그 데이터를 전달해서 화면 구성하기 위해서 자동 호출..
        //최초에도 한번 호출되고..
        //snapshot 에 실제 발생한 데이터..
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text(
              '${snapshot.data}',
              maxLines: 2,
              overflow: TextOverflow.fade,
            );
          }
          return Text('');
        }
    );
  }

  Widget makeJsonAssetWidget(context){
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/text/data.json'),
        builder: (context, snapshot){
          if(snapshot.hasData){
            //json parsing..
            var root = json.decode(snapshot.data.toString());
            return Text('json data : ${root[0]['name']}');
          }
          return Text('');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: AssetImage('assets/icon/user.png'),),
          Image.asset('assets/icon/user.png'),
          makeTextAssetWidget(context),
          makeJsonAssetWidget(context),
          Icon(Icons.menu),
          Icon(FontAwesomeIcons.music, size: 30, color: Colors.pink),
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/big.jpeg'), fit: BoxFit.cover
              ),
            ),
            width: 200,
            height: 200,
          )
        ]
      ),
    );
  }
}