import 'package:flutter/material.dart';
import '../login.dart';

class HirafyAccountReg extends StatefulWidget {
  @override
  _HirafyAccountRegState createState() => _HirafyAccountRegState();
}

class _HirafyAccountRegState extends State<HirafyAccountReg> {
  var selectedDate = DateTime.now();
  var birthday = "Select Your birthday";
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
  List<String> _jobs = ['1', '2', '3', '4']; // Option 2
  String _selectedJob;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthday = selectedDate.toString();
      });
  }

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

    //alert styl

    final signUpButton = MaterialButton(
      elevation: 2.0,
      color: Color(0xffF7D100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
      onPressed: () {},
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
                child: new Text("Hirafy Account",
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
                    "Hirafy Account gives you the possibility to get a job online, introduce yourself and present your projects as such as building a big community",
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
                  hint:
                      Text('Please choose a Job'), // Not necessary for Option 1
                  value: _selectedJob,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedJob = newValue;
                    });
                  },
                  items: _jobs.map((job) {
                    return DropdownMenuItem(
                      child: new Text(job),
                      value: job,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
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
          // username field
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: new Container(
                alignment: Alignment.center,
                height: 50,
                decoration: new BoxDecoration(
                  color: Color(0xfff7f7f8),
                  border: Border.all(color: Color(0xff000000), width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                    birthday.contains('Select')
                        ? "$birthday"
                        : "$birthday".substring(0, 10),
                    style: styleForm),
              ),
            ),
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
