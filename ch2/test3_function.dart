main() {
  //named parameter
  //optional 로 선언. 매개변수에 데이터가 대입이 안될 수도 있다...
  //nullable?
  //optional 매개변수, nullable 로 선언하던가.. default 값을 주던가..
  void funA(bool data1, {String data2 = 'world', int? data3}){}

  funA(true);//ok
  //값을 주려면 named parameter 로 선언되어 있어서.. 이름 생략이 불가능하다..
  // funA(true, 'hello', 10);//error
  funA(true,data2: 'hello', data3: 10);//ok
  //이름을 명시해서 데이터 대입함으로.. 순서는 상관없다..
  funA(true, data3: 20, data2: 'hello');


  //positional parameter
  void funB(bool data1, [String data2 = 'world', int? data3]){}
  funB(true);//ok
  // funB(true, data2:'hello', data3: 30);//error - 이름 명시 안된다..
  //순서를 맞추어서..
  funB(true, 'hello');//ok
  funB(true, 'hello', 40);//ok
  // funB(true, 40, 'hello');//error
}