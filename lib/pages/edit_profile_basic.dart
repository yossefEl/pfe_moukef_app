import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileBasic extends StatefulWidget {
  @override
  _EditProfileBasicState createState() => _EditProfileBasicState();
}

class _EditProfileBasicState extends State<EditProfileBasic>
    with SingleTickerProviderStateMixin {
       TextEditingController _nameFieldController = TextEditingController();
       TextEditingController _emailFieldController = TextEditingController();
       TextEditingController _phoneFieldController = TextEditingController();
       TextEditingController _locationFieldController = TextEditingController();
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
            Icons.done,
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
                background: Stack(
                    
                      children: <Widget>[
                       
                        Image.asset(
                          "images/profile.jpg",
                             width:  MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                         Positioned(
                          left: 0,
                          top: 0,
                          child: new Container(
                             height:MediaQuery.of(context).size.height * 0.4,
                             width:  MediaQuery.of(context).size.width,
                            color: Colors.black54.withOpacity(0.6),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: new Container(
                             height:MediaQuery.of(context).size.height * 0.4,
                             width:  MediaQuery.of(context).size.width,
                            child: Material(
                              color: Colors.transparent,
              child: new IconButton(
                                onPressed: (){},
                                icon:Icon(Icons.camera,size:50,color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
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
                                  "Editing Personnal info",
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
     Container(
       margin: EdgeInsets.all(10),
       child: TextField(
              controller: _nameFieldController,
              
              decoration: InputDecoration(
                hintText: "Enter new Name",
                icon: Icon(Icons.person,size: 35,),
              ),
            ),
     ),
      Divider(),
       Container(
       margin: EdgeInsets.all(10),
       child: TextField(
              controller: _emailFieldController,
              
              decoration: InputDecoration(
                hintText: "Enter new Email",
                icon: Icon(Icons.email,
                          size: 35,
        ),
              ),
            ),
     ),
      Divider(),
      Container(
       margin: EdgeInsets.all(10),
       child: TextField(
              controller: _phoneFieldController,
              
              decoration: InputDecoration(
                hintText: "Enter new Number Phone",
                icon: Icon(Icons.phone,
                          size: 35,
        ),
              ),
            ),
     ),
      Divider(),
   Container(
       margin: EdgeInsets.all(10),
       child: TextField(
              controller: _locationFieldController,
              
              decoration: InputDecoration(
                hintText: "Enter new Adress",
                icon: Icon(Icons.location_city,
                          size: 35,
        ),
              ),
            ),
     ),
      Divider(),

    ]);
  }
}
