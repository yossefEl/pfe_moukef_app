import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '../login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppViews extends StatelessWidget {
  static BuildContext appcontext;
  static const b = Color(0xff212529);
  static const r = Color(0xfff30707);
  static const y = Color(0xfffebf10);
  static const g = Color(0xffb4dd7f);
  final pages = [
    PageViewModel(
        pageColor: Colors.white,
        mainImage: Image.asset('images/views_assets/views1_colored.png'),
        title: new Text(''),
        bubble:new CircleAvatar(backgroundColor: Colors.white,),
        bubbleBackgroundColor: b,
        body: new Text("find the best talents\nin one click"),
        //  iconImageAssetPath: 'images/views_assets/views1_white.png',
        textStyle: new TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: b)),
    PageViewModel(
        pageColor: Colors.white,
        mainImage: Image.asset('images/views_assets/views2_colored.png'),
        title: new Text(''),
        bubble:new CircleAvatar(backgroundColor: Colors.white,),
        bubbleBackgroundColor: b,
        body: new Text("save your time\nand your effort"),
        //  iconImageAssetPath: 'images/views_assets/views2_white.png',
        textStyle: new TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: b)),
    PageViewModel(
      pageColor: Colors.white,
      mainImage: Image.asset('images/views_assets/views3_colored.png'),
      title: new Text(''),
      bubble:new CircleAvatar(backgroundColor: Colors.white,),
      bubbleBackgroundColor: b,
      body: new Text("multidisciplinary\nprofiles"),
      //  iconImageAssetPath: 'images/views_assets/views3_white.png',
      textStyle: new TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: b),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
              pages,
              onTapDoneButton: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('ignore_intro', 'true');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
              },
              pageButtonTextStyles: TextStyle(
                color: b,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ), //IntroViewsFlutter
      ), //Builder
    );
  }
}
