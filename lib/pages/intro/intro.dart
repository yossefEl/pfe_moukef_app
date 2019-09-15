import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key key}) : super(key: key);

  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  static const b = Color(0xff212529);
  static const y = Color(0xfffebf10);

  //forms

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: y,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    //border of the sliding up panel
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SlidingUpPanel(
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),),
       new ListView(
          children: <Widget>[
            new Container(
                alignment: Alignment.topCenter,
                color: b,
                height: 200,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "images/logo.png",
                      alignment: Alignment.center,
                      height: 40,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text(
                        "a brigde for you",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                )),
            new Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: new Text(
                      "LOG IN",
                      style: TextStyle(
                        color: b,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: new Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        emailField,
                        SizedBox(height: 15.0),
                        passwordField,
                        SizedBox(
                          height: 15.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            
          ],
        ),
              ],
      ),

    );
  }
}

Widget _floatingCollapsed(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    child: Center(
      child: Text(
        "This is the collapsed Widget",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget _floatingPanel(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 20.0,
          color: Colors.grey,
        ),
      ]
    ),
    margin: const EdgeInsets.all(24.0),
    child: Center(
      child: Text("This is the SlidingUpPanel when open"),
    ),
  );
}