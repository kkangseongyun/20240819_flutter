class MyClass {
  String name = 'kim';
  int no;

  MyClass(this.name, this.no);

  void sayHello() {}
}

//클래스를 상속 관계로 이용...
class Sub extends MyClass {
  Sub(no, name): super(name, no);
}
//interface 로 클래스 이용..
class InterfaceClass implements MyClass {
  //implements 에 선언된 모든 멤버를 오버라이드.. 생성자는 멤버가 아니다..
  String name = 'lee';
  int no = 20;
  @override
  void sayHello() {

  }
}

class A{}

//mixin 을 선언하면서.. 사용하는 클래스를 한정 짓고 싶다면..
mixin MyMixin on A {
  int mixinData = 0;
  void mixinFun(){}
}

class MixinTest extends A with MyMixin {
  void someFun() {
    //mixin 의 멤버를 자기꺼처럼...
    mixinData++;
    mixinFun();
  }
}