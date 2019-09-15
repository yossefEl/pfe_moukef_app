import 'package:flutter/material.dart';
import 'register.dart';
import 'pwd_reset.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'reset_pass_pages/verify_identity.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //an identifier of form to validate it
  final formKey = GlobalKey<FormState>();
  //remember me actions

  String _email;
  String _password;
  String acc_type;
  void _submitCommand() {
    final form = formKey.currentState;
    if(rememberMeHirafy==false &&rememberMeBasic==false) 
    {snackError("Please your account type");}
    if (form.validate()) {
      form.save();
      print(_password);
      print(_email);
      FutureBuilder<Map>(
        future: login(),
        builder: (context, snap) {
          print(snap.error);
          if (snap.hasError) {
            if (snap.hashCode == 500) {
              snackError("Internal Server Error");
            }
          } else if (snap.hasData) {
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    }
  }

  var email;
  var nom;
  Future<Map> login() async {
    final resp = await http
        .post("http://192.168.0.102:3232/pfe/apis/login.php", body: {
      "login": "login",
      "apid": "d4b1593db66ea9d4re0b53fd921880az322d",
      "email": _email,
      "pass": _password,
      "acc_type":acc_type,
    });

    Map map = json.decode(resp.body);
    print(map['resp']);
    if (map.length == 0) {
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Container(
            height: 35,
            alignment: Alignment.center,
            child: Text(
              'Internal Server Error',
              style: snackStyle,
            )),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else if (map['resp']['type'] == 'error') {
      snackError(map['resp']['message']);
    } else if (map['resp']['type'] == 'sucess') {
      snackSucess(map['resp']['message']);
      nom = map['resp']['userinfo'][1];
       var _activeAccount = map['resp']['code'];
      if (_activeAccount == 1) {
        snackSucess(map['resp']['message']);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', _email);
          print(prefs.getString('email'));
        Timer(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home()));
        });
      } else if (_activeAccount == 0) {
        var _code = map['resp']['ver'];
        snackSucess(map['resp']['message']);
        snackSucess("Verify your email with secret code sent to your email!");
        print(_email);
        Timer(Duration(seconds: 2), () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  RestPassVerification(code: _code, email: _email)));
        });
      }
    }

    return map;
  }

  snackError(var msg) {
    final snackbar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Container(
          height: 35,
          alignment: Alignment.center,
          child: Text(
            "$msg",
            style: snackStyle,
          )),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  snackSucess(var msg) {
    final snackbar = SnackBar(
      backgroundColor: Colors.green,
      content: Container(
          height: 35,
          alignment: Alignment.center,
          child: Text(
            "$msg",
            style: snackStyle,
          )),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  bool rememberMeHirafy = false;
  bool rememberMeBasic = false;
  void _onRememberMeBasicChanged(bool newValue) => setState(() {
        rememberMeBasic = newValue;
        rememberMeHirafy = !rememberMeBasic;
        acc_type = "basic";
      });
  void _onRememberMeHirafyChanged(bool newValue) => setState(() {
        rememberMeHirafy = newValue;
        rememberMeBasic = !rememberMeHirafy;
        acc_type = "hirafy";
      });
  var style = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 18,
    color: Colors.white,
  );
  var styleForm = TextStyle(
    color: Colors.black87,
    fontFamily: "Montserrat",
    fontSize: 17,
  );
  var snackStyle = TextStyle(fontFamily: "Montserrat", fontSize: 15);

  @override
  Widget build(BuildContext context) {
    final userField = TextFormField(
        validator: (val) =>
            !EmailValidator.validate(val, true) ? 'Not a valid email.' : null,
        onSaved: (val) => _email = val,
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "username@moukef.com",
          fillColor: Colors.white,
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

    final passwordField = TextFormField(
        validator: (val) => val.length < 8 ? 'Password is too short..' : null,
        onSaved: (val) => _password = val,
        obscureText: true,
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: Color(0xfff7d100))),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(30),
          ),
        ));
    // login button style
    final loginButton = MaterialButton(
      elevation: 5.0,
    
      color: Color(0xfff7d100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
      onPressed: () {
        _submitCommand();
        // Navigator.ofNavigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      },
      child: Text(
        "Login",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.black),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      extendBody: false,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          new Image.asset(
            "images/bg.png",
            fit: BoxFit.cover,
          ),
          new Center(
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 110.0, bottom: 20),
                  child: new Image.asset(
                    "images/logo.png",
                    height: 40,
                  ),
                ),

                new SizedBox(height: 20),
                // FORM
                // username field

                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 50),
                        child: userField,
                      ),
                      SizedBox(height: 20),
                      // username field
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 50),
                        child: passwordField,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, left: 50, bottom: 10),
                        child: loginButton,
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Color(0xfff7d100),
                            value: rememberMeBasic,
                            onChanged: _onRememberMeBasicChanged),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: new Text(
                          "Basic",
                          style: style.copyWith(fontSize: 15),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Color(0xfff7d100),
                            value: rememberMeHirafy,
                            onChanged: _onRememberMeHirafyChanged),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: new Text(
                          "Hiray",
                          style: style.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                //forgot pass
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                  ),
                  child: Center(
                      child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetPass()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child: new Text("Forgot Password ?",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  )),
                ),

                SizedBox(height: 5),
                //create account text btn

                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                  ),
                  child: Center(
                      child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child: new Text("Create account",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
