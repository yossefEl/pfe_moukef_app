import 'package:flutter/material.dart';
import './views.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  getWay() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var isViewed = prefs.getString('ignore_intro');
     return isViewed;
  }
  @override 
  void initState(){
    if(getWay()==null)
    {
      Timer(Duration(seconds: 3),()=>{
            Navigator.of(context).pushReplacementNamed('/views')
    });
    }
    else{
      Timer(Duration(seconds: 3),()=>{
            Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => Login()))
    });

    }
    super.initState();
    
  }
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          
          alignment: Alignment.center,
          color: Colors.white,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Image.asset("images/logo.png",
                height: 40,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                ),
                new Padding(
                  padding: EdgeInsets.only(top:10),
                                  child: new Text(
                    "a bridge for you",
                    style: new TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                    ),
                  ),
                )

            ],
            ),
        ),
      ],
    ));
  }
}
