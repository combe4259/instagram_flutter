import 'package:flutter/material.dart';
import 'package:untitled1/pages/message_page.dart';
import 'package:untitled1/pages/home_page.dart';
class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Home(),
        Message()
      ],
    );
  }
}
