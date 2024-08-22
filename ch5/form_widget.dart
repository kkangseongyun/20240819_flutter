import 'package:flutter/material.dart';

//유저 입력 데이터 저장..
class User {
  String firstName = '';
  String lastName = '';
}

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormWidgetState();
  }
}
class FormWidgetState extends State<FormWidget>{
  //Form 에 설정할 key, 이후 필요한 순간 key 를 이용해 매핑된 Form 의 State 객체 획득.. 함수 호출..
  final formKey = GlobalKey<FormState>();
  final user = User();

  void save() {
    //유효성 검증이 통과된 후 호출.. 데이터 저장 작업..
    print('save()... ${user.firstName}, ${user.lastName}');
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //유저 입력의 기본은 TextField 이지만 Form 과 연동하기 위해서는 TextFormField
          TextFormField(
            decoration: InputDecoration(labelText: 'first name'),
            //Form 의 State 의 validate() 함수 호출하는 순간 Form 하위의 모든 Field 의 validator 에
            // 등록한 함수 호출
            //매개변수는 그 순간 유저가 입력한 데이터..
            validator: (value){
              if(value?.isEmpty ?? false){
                //문자열 리턴 - invalid 상황. 리턴시킨 문자열이 유저 화면에 자동으로 나온다.
                return 'please enter your first name';
              }
              return null;//valid 상황..
            },
            //Form - State 의 save() 함수를 호출하는 순간 Form 하위의 모든 Field 의 onSaved 함수 호출..
            onSaved: (value) {
              setState(() {
                user.firstName = value ?? '';
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'last name'),
            validator: (value){
              if(value?.isEmpty ?? false){
                return 'please enter your last name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                user.lastName = value ?? '';
              });
            },
          ),
          ElevatedButton(
              onPressed: (){
                //key 를 이용해 widget 의 state 획득..
                final form = formKey.currentState;
                //전체 유효성 검증..
                //모든 하위 Field 에서 null 이 리턴되면 전체 valid - true
                if(form?.validate() ?? false){
                  form?.save();//모든 하위 Field 의 onSaved 함수 호출
                  save();
                }
              },
              child: Text('save')
          )
        ],
      ),
    );
  }
}