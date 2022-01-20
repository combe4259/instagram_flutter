import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/pages.dart';
import 'package:untitled1/pages/login_page.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context,AsyncSnapshot<SharedPreferences> snapshot){
        if (snapshot.connectionState == ConnectionState.done){//데이터가 반환 될수도 에러가 반환 될 수도
          if(snapshot.hasError){
            return const Text("has Error");
          }
          else{
            return snapshot.data!.getBool("loginData") ?? false ? Pages() : Login();
          }
        }
        else{//getinstance과정이 다 끝나지 않고 진행되고 있는 경우
          return CircularProgressIndicator();
        }
      },
    );
  }
}
