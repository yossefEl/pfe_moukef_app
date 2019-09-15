import 'package:flutter/material.dart';
import './login.dart';
import './reset_pass_pages/verify_identity.dart';

class ResetPass extends StatefulWidget {
  ResetPass({Key key}) : super(key: key);

  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 18,
      color: Colors.black26,
    );
    var styleForm = TextStyle(
      color: Colors.black87,
      fontFamily: "Montserrat",
      fontSize: 17,
    );

    final emailField = TextField(
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "hello@elias.com",
          fillColor: Color(0xfff7f7f8),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Color(0xfff7d100))),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    // password field style

    final resetPassButton = MaterialButton(
      elevation: 2.0,
      color: Color(0xfff7d100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
      onPressed: () {
        Route route = MaterialPageRoute(builder: (context) => RestPassVerification());
        Navigator.of(context).push(route);
      },
      child: Text(
        "Send me Password",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.black54, fontSize: 14),
      ),
    );
final _height= MediaQuery.of(context).size.height*0.27;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin:EdgeInsets.only(top:_height),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Center(
              child: new Text("Forgotten Password ?",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.center)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: emailField,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: resetPassButton,
            ),
            SizedBox(height:10),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Text(
              "Already have an account?",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontFamily: "Montserrat"),
            ),
            Center(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  child: new Text("Sign in",
                      style: TextStyle(
                          color: Color(0xfff7d100),
                          fontSize: 15,
                          fontFamily: "Montserrat"),
                      textAlign: TextAlign.center),
                ),
              ),
            )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
