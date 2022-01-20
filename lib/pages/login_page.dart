import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/pages.dart';
import 'home_page.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  Map loginData = {
    "asdf" : "1234"
  };

  Widget logoArea(){
    return Center(
      child: Image.asset("images/logo.png",width: 200,)
    );
  }
  Widget inputArea(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(child: TextField(controller: idController,),width:350),//둘러쌓인 위젯의 크기만큼 확장
        Container(child: TextField(controller: pwController,),width: 350,),
        SizedBox(height: 12,),
        Text("비밀번호를 잊으셨나요?",style:TextStyle(color:Colors.blue)),
      ],
    );
  }
  Widget loginArea(){
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () async{
            if (idController.text=="") {
              print("아이디를 입력해주세요");
              return;
            }
            if (pwController.text=="") {
            print("비밀번호를 입력해주세요");
            return;
            }
            if (loginData.containsKey(idController.text)==false) {
             print("아이디가 존재하지 않습니다");
             return;
            }
            if (loginData[idController.text]!=pwController.text) {
             print("아이디와 비밀번호가 일치하지않습니다");
             return;
            }
           print("로그인 성공");
            final prefs = await SharedPreferences.getInstance(); //로그인 여부를 저장하기 위해 로그인 성공 후 데이터 저장
            prefs.setBool("loginData", true);
           Navigator.push(context, MaterialPageRoute(builder: (context) => Pages()));
          },
          child: Container(
            width: 300,
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 2,
              width: 300,
              color: Colors.grey,
            ),
            Container(
              child: Center(child: (Text("또는"))),
              width: 80,
              color: Colors.white,
            )
          ],
          ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
  Widget signinArea(){
    return Column(
      children: [
        Container(
          height: 2,
          width: 300,
          color: Colors.grey,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("계정이 없으신가요?"),
            Text("가입하기",style: TextStyle(color: Colors.blue),)
          ],
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [
            Column(//children 안에있는 위젯들을 수직으로 쌓아주는 위젯
            mainAxisAlignment: MainAxisAlignment.center,
             children: [logoArea(),inputArea(),loginArea()],
            ),
            Positioned(
                bottom:0,
                right: 0,
                left:0,
                child: Padding(
                    child: signinArea(),
                    padding: EdgeInsets.only(bottom: 20),
            ))
          ],
      )
    );
  }
}