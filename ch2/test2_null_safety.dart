// int data1;//error
int data1 = 10;
int? data2;

main() {
  // data1 = null;//error
  data2 = null;
  data2 = 20;

  //operator - !
  data2!;
  data2=null;
  // data2!;//runtime error - Null check operator used on a null value

  //operator - ?. - nullable member 참조 연산자..
  data1.isEven;
  data2?.isEven;

  bool? result = data2?.isEven;

  //operator - ?? - null 인 경우의 대체 값..
  String? a1 = 'hello';
  String? a2 = a1 ?? 'world';//hello
  a1 = null;
  a2 = a1 ?? 'world';//world

  //casting... 타입적으로 nullable 이 non-null 의 상위.. 
  data2 = data1;//non-null -> nullable : 암시적 캐스팅
  data1 = data2 as int;//nullable -> non-null : 명시적 캐스팅

}

