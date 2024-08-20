class User {
  String? name;
  int? age;

  User(this.name, this.age);

  void sayHello(){
    print('name : $name, age: $age');
  }

  //named constructor
  User.one() {}
  //initialize block 에서 멤버 초기화...
  User.two(String name, int age):this.name = name, this.age=age{}
  //initialize block 에서 다른 생성자 호출(this(), super())
  User.three(): this.one();
}

class Singleton {
  int? data;
  //생성자를 private 으로..
  Singleton._privateContructor();
  static final Singleton _instance = Singleton._privateContructor();
  factory Singleton() => _instance;
}

main() {
  User user1 = new User('kim', 30);
  user1.sayHello();//name : kim, age: 30

  User user2 = User.one();
  User user3 = User.two('lee', 20);

  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  obj1.data = 10;
  obj2.data = 20;
  print('${obj1.data}, ${obj2.data}');//20, 20
}