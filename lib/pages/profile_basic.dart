import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileBasic extends StatefulWidget {
  @override
  _ProfileBasicState createState() => _ProfileBasicState();
}

class _ProfileBasicState extends State<ProfileBasic>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  var style = TextStyle(
      fontFamily: "Montserrat", fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          child: new Icon(
            Icons.edit,
            size: 20,
            color: Colors.black,
          )),
      resizeToAvoidBottomPadding: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: new AlignmentDirectional(-1.3, 0.79),
                    child: new Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  background: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: new Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Icon(Icons.person),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: new Text(
                                  "Personnal info",
                                  style: style,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ];
          },
          body: _aboutSection()),
    );
  }

  var titleStyle =
      TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);
  var subtitleStyle = TextStyle(
    color: Colors.black54,
    fontSize: 13,
  );

  Widget _aboutSection() {
    return ListView(children: <Widget>[
      new ListTile(
        leading: new Icon(
          Icons.person,
          size: 35,
          color: Colors.black,
        ),
        title: new Text(
          "Name",
          style: titleStyle,
        ),
        subtitle: new Text(
          "Tahir Alami",
          style: subtitleStyle,
        ),
      ),
      Divider(),

      new ListTile(
        leading: new Icon(
          Icons.email,
          size: 35,
          color: Colors.black,
        ),
        title: new Text(
          "Email",
          style: titleStyle,
        ),
        subtitle: new Text(
          "user@moukef.com",
          style: subtitleStyle,
        ),
      ),
      Divider(),
      new ListTile(

      
        leading: new Icon(
          Icons.phone,
          size: 35,
          color: Colors.black,
        ),
        title: new Text(
          "Phone Number",
          style: titleStyle,
        ),
        subtitle: new Text(
          "+212 639 65 31 87",
          style: subtitleStyle,
        ),
      ),
      Divider(),

      new ListTile(

      
        leading: new Icon(
          Icons.location_city,
          size: 35,
          color: Colors.black,
        ),
        title: new Text(
          "Asdress",
          style: titleStyle,
        ),
        subtitle: new Text(
          "Marrakech",
          style: subtitleStyle,
        ),
      ),
      Divider(),
    ]);
  }
}
