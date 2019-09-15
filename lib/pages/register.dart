import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'login.dart';
import './register_pages/basic_acc.dart';
import './register_pages/hirafy_acc.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
    final userField = TextFormField(
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Full Name",
          fillColor: Color(0xfff7f7f8),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Color(0xffF7D100))),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    final emailField = TextFormField(
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "moukef@web.com",
          fillColor: Color(0xfff7f7f8),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Color(0xffF7D100))),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    // password field style
    final passwordField = TextFormField(
        obscureText: true,
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          fillColor: Color(0xfff7f7f8),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Color(0xffF7D100))),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    //alert style
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds:400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    final signUpButton = MaterialButton(
      elevation: 2.0,
      color: Color(0xffF7D100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
      onPressed: () {
        Alert(
          style: alertStyle,
          context: context,
          type: AlertType.info,
          title: "Choose Account?",
          desc: "Moukef gives more than one option when creating your account for more fun and simplicity, ",
          buttons: [
            DialogButton(
              child: Text(
                "Hirafy Account",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HirafyAccountReg()));
              },
              color: Colors.amber[700],
            ),
            DialogButton(
              child: Text(
                "Basic Account",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BasicAccountReg()));
              },
              color:Colors.black87
            )
          ],
        ).show();
      },
      child: Text(
        "Create Account",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.black),
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: new AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: new Image.asset(
              "images/logo.png",
              height: 25,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Center(
                child: new Text("Be a part of \nMoukef Family",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.center)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 5, right: 30, left: 30),
            child: Center(
                child: new Text(
                    "Join the biggest community of artisans in Morocco",
                    style: style,
                    textAlign: TextAlign.center)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: userField,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: emailField,
          ),

          SizedBox(height: 20),
          // username field
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: passwordField,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: signUpButton,
          ),

          SizedBox(height: 40),

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
                            color: Color(0xffF7D100),
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
    );
  }
}
