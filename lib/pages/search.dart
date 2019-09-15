import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //initializing the list and the city
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
  // filters values

  bool indiviVal;
  bool compVal;
  bool cvVal;
  bool whatsappVal;
  bool emailVal;
  bool sortVal;

  String _selectedCity;
  List<String> _jobs = ['1', '2', '3', '4']; // Option 2
  String _selectedJob;

  static TextStyle style = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 18,
    color: Colors.black26,
  );
  //style of filters alert
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    overlayColor: Colors.black.withOpacity(0.35),
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Alert(
                style: alertStyle,
                context: context,
                title: "Advanced Search filters",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]).show();
          },
          child: new Icon(Icons.filter_list, size: 30),
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: true,
              centerTitle: true,
              pinned: true,
              leading: new IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20,
                  )),
              backgroundColor: Colors.white,
              expandedHeight: _height * 0.55,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    new Container(
                      color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(top: 25),
                            alignment: Alignment.topCenter,
                            child: new Image.asset(
                              "images/logo.png",
                              height: 30,
                            ),
                          ),
                          new SizedBox(height: 15),
                          Container(
                            width: _width * 0.8,
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
                          new SizedBox(height: 10),
                          Container(
                            width: _width * 0.8,
                            child: DropdownButton(
                              isExpanded: true,
                              elevation: 2,
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text(
                                  'Please choose a  Job'), // Not necessary for Option 1
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
                          new SizedBox(height: 15),
                          new Container(
                            width: _width * 0.8,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            child: new RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0)),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              color: Colors.amber,
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(Icons.search),
                                    new Text(
                                      "Search",
                                      style: style.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 90.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 03.60,
                            spreadRadius: 0.10),
                      ],
                    ),
                    height: 90,
                    margin: index == 0
                        ? new EdgeInsets.only(
                            top: 0, bottom: 5, right: 7, left: 7)
                        : new EdgeInsets.only(
                            top: 5, bottom: 5, right: 7, left: 7),
                    child: Row(
                      children: <Widget>[
                        new Container(
                          height: 90,
                          width: 90,
                          // padding: EdgeInsets.only(top: 25),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/profile.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 20),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "Name",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                new Text(
                                  "city",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                ),
                              ]),
                        ),
                        Spacer(),
                        new IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        )
                      ],
                    )),
                childCount: 15,
              ),
            ),
          ],
        ));
  }

}
