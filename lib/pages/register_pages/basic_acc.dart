import 'package:flutter/material.dart';
import '../login.dart';
class BasicAccountReg extends StatefulWidget {
  @override
  _BasicAccountRegState createState() => _BasicAccountRegState();
}

class _BasicAccountRegState extends State<BasicAccountReg> {
  String _selectedCity;
  List<String> _cities = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];
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

    final teleField = TextField(
        cursorColor: Colors.black26,
        textAlign: TextAlign.center,
        style: styleForm,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "+212 6xx xx xx xx",
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
    //alert styl

    final signUpButton = MaterialButton(
      elevation: 2.0,
      color: Color(0xffF7D100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
      onPressed: () {
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
                child: new Text("Basic Account",
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
                    "Basic Account gives you the possibility to navigate and browse in the website, share and rate employees and more..",
                    style: style.copyWith(fontSize: 15),
                    
                    textAlign: TextAlign.center)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              height: 50,
              decoration: new BoxDecoration(
                color: Color(0xfff7f7f8),
                border: Border.all(color: Color(0xff000000), width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  elevation: 2,
                  icon: Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                      'Please choose a City'), // Not necessary for Option 1
                  value: _selectedCity,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  },
                  items: _cities.map((city) {
                    return DropdownMenuItem(
                      child: new Text(city),
                      value: city,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: teleField,
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
