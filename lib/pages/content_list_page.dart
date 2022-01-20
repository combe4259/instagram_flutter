import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/items/instagram_content_item.dart';

class ContentList extends StatefulWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset("images/logo.png",width: 140),
        centerTitle: false,
        actions: [
          Padding(
              padding: const EdgeInsets.only(left:14, right: 14),
              child: InkWell(onTap: () async{
                if (!await Permission.photos.request().isGranted){
                  return;
                }
                final ImagePicker _picker = ImagePicker();
                final PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
                if(image==null){
                  return;
                }
                setState(() {
                  items.add(Image.file(File(image.path),width: 50,height: 50,));
                });
              },
                  child: Image.asset("images/add.png",width: 40,))),
          Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Image.asset("images/heart.png",width: 40,)),
          Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Image.asset("images/send.png",width: 40,)),
        ],
        elevation: 0,
      ),
      body:ListView(
        children: [
          Row(children: items,),
          InstagramContentItem(profileImg: "images/profile.png", userName: "김준형", content: "인스타", contentImg: "images/logo.png", count: 100)
        ],
      ),
    );

  }
}
