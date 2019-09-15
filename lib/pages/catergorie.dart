import 'package:flutter/material.dart';
class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
 var style = TextStyle(
      fontFamily: "Montserrat", fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
             slivers: <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: new AlignmentDirectional(-1.3, 0.79),
                    child: new Text(
                      "Categorie Name",
                    
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
                        height: 20,
                        width: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      )),
                ),
              ),
               _aboutSection()
            ]
      )     
    );
}

  var titleStyle =
      TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);
  var subtitleStyle = TextStyle(
    color: Colors.black54,
    fontSize: 13,
  );

  Widget _aboutSection() {
    return SliverFixedExtentList(
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
            );
  }
}
