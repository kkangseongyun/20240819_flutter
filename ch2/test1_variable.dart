main() {
  //모든 변수는 객체다....
  int data1 = 10;
  print(data1.isEven);

  // double data2 = data1;//error
  double data2 = data1.toDouble();
  int data3 = data2.toInt();
  //string <->int
  String data4 = '10';
  int data5 = int.parse(data4);
  String data6 = data5.toString();

  //타입유추.. var, dynamic
  int a1 = 10;
  // a1 = 'hello';//error
  var a2 = 10;//타입이 없는 것이 아니라.. 변수 선언시 대입 값으로.. 타입이 유추..
  // a2 = 'hello';//error

  //모든 타입의 데이터를 가질수 있는 특수 타입.. 다른 언어에서의 any 타입..
  dynamic a3 = 10;
  a3 = true;
  a3 = 'hello';

  //타입 유추 기법이다.. 대입되는 값에 의해 타입이 유추된다..
  //선언과 동시에 값을 주지 않았다면.. dynamic type 으로 유추...
  var a4;
  a4 = 10;
  a4 = true;

  //List...............
  //List 처럼.. 가변...
  List<int> list1 = [10, 20];
  list1.add(30);
  //사이즈 고정.. filled 생성자 이용...
  List<int> list2 = List.filled(3, 0);
  list2[0] = 10;
  list2.add(40);//Cannot add to a fixed-length list

  Map map1 = {1:10, 'two':'world'};
  map1['two']='hello';

}