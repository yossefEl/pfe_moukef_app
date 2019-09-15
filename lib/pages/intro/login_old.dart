import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const b = Color(0xff212529);
  static const y = Color(0xfffebf10);
  @override
  Widget build(BuildContext context) {
    var TitleStyle = TextStyle(
        color: b,
        fontFamily: "Montserrat",
        fontSize: 23,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 200,
            decoration: BoxDecoration(
              color: b,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  "images/logo.png",
                  color: Colors.white,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    "a bridge for you",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(child: Text("login", style: TitleStyle)),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: inputFields("Email"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: inputFields("Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                new MaterialButton(
                  onPressed: () {},
                  color: y,
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width - 40,
                  child: new Text(
                    "login",
                    style: TextStyle(
                        color: b,
                        fontSize: 17,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget inputFields(String hint) {
  return TextField(
    cursorColor: Color(0xfffebf10),
    autocorrect: true,
    obscureText: hint.contains("Password")?true:false,
    decoration: InputDecoration(
        labelStyle: new TextStyle(color: const Color(0xfffebf10)),
        labelText: hint,
        focusedBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Color(0xfffebf10)))),
  );
}
