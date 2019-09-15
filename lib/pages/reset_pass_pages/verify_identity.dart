import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flushbar/flushbar.dart';
import 'package:moukef/pages/login.dart';
import 'change_pass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class RestPassVerification extends StatefulWidget {
  final code;
  final email;
  RestPassVerification({Key key, this.code, this.email}) : super(key: key);
  @override
  _RestPassVerificationState createState() => _RestPassVerificationState();
}

class _RestPassVerificationState extends State<RestPassVerification> {
  static final int _pinLength = 4;

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
  );
  var style = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 18,
    color: Colors.black26,
  );

  PinEditingController _pinEditingController =
      PinEditingController(pinLength: _pinLength, autoDispose: false);
  // final scaffoldKey = new GlobalKey<ScaffoldState>();

  PinDecoration _pinDecoration = UnderlineDecoration(
    textStyle: _textStyle,
    enteredColor: Color(0xff4ac1ae),
  );

  // Future<Map> verify() async {
  //   final resp =
  //       await http.post("http://www.eliascompletecare.co.uk/api/verify_email.php", body: {
  //     "verify": "verify",
  //     "apid": "d4b1593db66ea9d4re0b53fd921880az322d",
  //     "email": widget.email,
  //   });

  //   Map map = json.decode(resp.body);
  //   print(map['resp']['type']);
  //   if (map.length == 0) {
  //     _flushBarError(map['resp']['message']);
  //   } else if (map['resp']['type'] == 'error') {
  //     _flushBarError(map['resp']['message']);
  //   } else if (map['resp']['type'] == 'sucess') {
  //     _flushBarSucess(map['resp']['message']);
  //     Timer(Duration(seconds: 2), () {
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  //     });
  //   }
  //   return map;
  // }

  var snackStyle = TextStyle(fontFamily: "Montserrat", fontSize: 15);
  _flushBarError(String message) {
    Flushbar(
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      message: "$message",
      backgroundColor: Colors.red,
    )..show(context);
  }

  _flushBarSucess(String message) {
    Flushbar(
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      message: "$message",
      backgroundColor: Colors.green,
    )..show(context);
  }

  @override
  void initState() {
    _pinEditingController.addListener(() {
      debugPrint('changed pin:${_pinEditingController.text}');
    });
    super.initState();
  }

  @override
  void dispose() {
    _pinEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    var _top = _height * 0.2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: Colors.black,
              ))),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                height: 120,
                decoration:BoxDecoration(
                
                  image:DecorationImage(
                    image:ExactAssetImage("images/validate_email.png"),
                  )
                )
              ),
              Center(
                  child: new Text("Verify Your Email",
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: "Montserrat",
                      ),
                      textAlign: TextAlign.center)),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 8),
                child: Center(
                    child: new Text(
                        "Please check your email inbox, then copy and paste the pin you received",
                        style: style,
                        textAlign: TextAlign.center)),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.76,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: PinInputTextField(
                    pinLength: _pinLength,
                    decoration: _pinDecoration,
                    pinEditingController: _pinEditingController,
                    autoFocus: true,
                    textInputAction: TextInputAction.go,
                    onSubmit: (pin) {
                      if (widget.code == pin) {
                        FocusScope.of(context).requestFocus(new FocusNode());
                         Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ChangePassword()));
                        //   FutureBuilder<Map>(
                        //     future: verify(),
                        //     builder: (context, snap) {
                        //       if (snap.hasError) {
                        //         print("erroor");
                        //       } else if (snap.hasData) {
                        //       } else {
                        //         return Center(child: CircularProgressIndicator());
                        //       }
                        //     },
                        //   );
                      } else {
                        _flushBarError("Invalid code");
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ChangePassword()));
                      }
                      debugPrint('submit pin:$pin');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
