import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    //add..................................
    return MaterialApp.router(
      routerDelegate: MyRouteDelegate(),
      routeInformationParser: MyParser(),
    );
  }
}
//add...................................
//라우팅 분석을 통해 유지되어야 하는 데이터를 담기 위한 개발자 클래스
//필요한 만큼 변수, 생성자등 추가..
class MyRoutePath {
  String? id;

  MyRoutePath.home(): this.id = null;
  MyRoutePath.detail(this.id);
}

//앱의 라우팅을 위한 정보 분석 역할..
//분석 결과로 제네릭 타입의 데이터를 발생..
class MyParser extends RouteInformationParser<MyRoutePath> {
  //앱이 실행되면서 최초 한번 호출.. 앱의 초기 라우팅 정보 분석..
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async{
    Uri uri = routeInformation.uri;
    if(uri.pathSegments.length >= 2){
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    }else {
      return MyRoutePath.home();
    }
  }
}

//실제 네비게이션을 처리하는 역할..
class MyRouteDelegate extends RouterDelegate<MyRoutePath>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {

  String? selectId;//navigation 알고리즘상 필요한 데이터라는 가정..
  //앱 전역에 라우팅이 복잡하다면.. 여러개의 delegator 가 만들어 질수도 있어서.. 키로 구분..
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //화면 전환이 필요할때 호출될 개발자 함수..
  //화면 전환은 실제 화면을 구성하는 위젯에서 유저 이벤트 상황등에 전환 시켜야 함으로..
  //이 함수를 전환시키는 위젯에 전달.. 위젯에서 호출하게..
  //위젯의 생성자에 전달되는 함수.
  void handleOnPressed(String id){
    selectId = id;
    //화면 전환이 필요하다고 명령..
    notifyListeners();
  }

  //parser 가 정보 분석한 값을 매개변수로 전달하면서.. delegate 초기화시 최초 한번 호출..
  //parser 의 parseRouteInformation 가 호출된후 그 다음 호출.. parseRouteInformation 가 리턴한 값 전달
  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async{
    //parser 가 분석한 정보를 바탕으로 구체적인 라우팅을 위해 필요한 데이터 초기화..
    if(configuration.id != null){
      selectId = configuration.id;
    }
  }

  //최초 setNewRoutePath 호출된 후에 호출,
  //이후 notifyListeners() 호출 될때마다 호출..
  //build() - 화면전환 직전에 호출되어.. 현재의 화면 전환을 위한 정보를 저장하고자 한다면 그 정보를 만드는 역할
  @override
  MyRoutePath? get currentConfiguration {
    //여기서 리턴시킨 정보가.. 저장되어야 하는 데이터..
    //정보만 만드는 것이고 이 정보가  parser 의  restoreRouteInfomation 으로 전달되어서 구체적인 저장은
    //parser 에서
    if(selectId != null){
      return MyRoutePath.detail(selectId);
    }else {
      return MyRoutePath.home();
    }
  }
  //화면전환 역할자.. 구체적인 화면을 구성하겠다는 것이 아니라..
  //현 상황에 맞는 화면을 stack 구조로 유지시키는..
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(handleOnPressed)),
        if(selectId != null) MaterialPage(child: DetailScreen(selectId))
      ],
      onPopPage: (route, result){
        if(!route.didPop(result)){
          return false;
        }
        selectId = null;
        notifyListeners();
        return true;
      },
    );
  }
}



class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              ElevatedButton(
                child: Text('go detail with 1'),
                onPressed: () => onPressed('1'),
              ),
              ElevatedButton(
                child: Text('go detail with 2'),
                onPressed: () => onPressed('2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            'Detail Screen $id',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
