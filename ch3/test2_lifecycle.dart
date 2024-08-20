import 'package:flutter/material.dart';
//앱 전역의 상태를 관리하기 위한 패키지.. 조상의 상태를 하위에서 쉽게 이용하는 방법 제공..
import 'package:provider/provider.dart';

void main() => runApp(ParentWidget());

//상위의 상태 값 변경시에 하위의 라이프사이클이 어떻게 변경되는지 테스트를 위해서 stateful 로 만든거다..
//화면 전체를 목적으로 하는 위젯, 혹은 위젯 트리의 루트 역할을 하는 위젯을 stateful 로 만드는 것은 좋지 않다.
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }
}
class ParentState extends State<ParentWidget> {
  //상위에서 유지되는 상태 데이터.. 하위에 전파되는 데이터..
  int _count = 0;
  //이벤트 콜백..
  void _incrementCount() {
    //상태 변경하면서 화면 re-rendering...
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Lifecycle Test'),),
        //상위 데이터를 하위에 전파하기 위해서.. value 에 명시한 값을 하위에서 이용할 수 있다..
        body: Provider.value(
            value: _count,
            child: Column(
              children: [
                Text('i am parent widget $_count'),
                ElevatedButton(onPressed: _incrementCount, child: Text('increment'),),
                ChildWidget(),
              ],
            ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget(){
    print('ChildWidget constructor...');
  }
  @override
  State<StatefulWidget> createState() {
    return ChildState();
  }
}
//WidgetsBindingObserver - app 전체의 lifecycle 을 판단하기 위해서..
//app 의 화면이 나오거나 나오지 않거나..
class ChildState extends State<ChildWidget> with WidgetsBindingObserver{
  
}