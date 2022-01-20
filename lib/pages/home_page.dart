import "package:flutter/material.dart";
import 'package:untitled1/pages/content_list_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;

  List<Widget> pages=[
    ContentList(),
    Center(
      child: Text("홈화면"),
    ),
    Center(
      child: Text("검색화면"),
    ),
    Center(
      child: Text("비디오화면"),
    ),
    Center(
      child: Text("쇼핑화면"),
    ),
    Center(
      child: Text("프로필화면"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset("images/home.png",width: 20,),label: ""),
          BottomNavigationBarItem(icon: Image.asset("images/search.png",width: 20,),label: ""),
          BottomNavigationBarItem(icon: Image.asset("images/video.png",width: 20,),label: ""),
          BottomNavigationBarItem(icon: Image.asset("images/bag.png",width: 20,),label: ""),
          BottomNavigationBarItem(icon: Image.asset("images/profile.png",width: 20,),label: ""),
        ],
      ),
    );
  }
}
