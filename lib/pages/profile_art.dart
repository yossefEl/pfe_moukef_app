import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileArtisan extends StatefulWidget {
  @override
  _ProfileArtisanState createState() => _ProfileArtisanState();
}

class _ProfileArtisanState extends State<ProfileArtisan>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  var genTitleStyle = TextStyle(
      fontFamily: "Montserrat", fontSize: 18, fontWeight: FontWeight.bold);
  String string =
      "l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl";
  // nbline=strlen/33
  // lineHeight:10, measn
  // +marginTol\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simpl l\'imprimeriemrem Ipsum est simplp=50
  // height=(string.length/33)+((string.length/33)*10)+30

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            print(string.length / 33);
          },
          backgroundColor: Colors.amber,
          child: new Icon(
            Icons.edit,
            size: 20,
            color: Colors.black,
          )),
      resizeToAvoidBottomPadding: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: NestedScrollView(
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
                      "Profile",
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
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.black,
                      tabs: [
                        new Tab(
                          icon: new Icon(Icons.person),
                        ),
                        new Tab(
                          icon: new Icon(Icons.map),
                        ),
                        new Tab(
                          icon: new Icon(Icons.rate_review),
                        ),
                        new Tab(
                          icon: new Icon(Icons.work),
                        ),
                      ],
                      indicatorColor: Colors.amber,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _aboutSection(),
              Container(
                color: Colors.green,
              ),
              _reviewSection(),
              _projectSection(context),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  Widget _aboutSection() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 15),
                    child: new Text(
                      "General title",
                      style: genTitleStyle,
                    )),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                                SizedBox(width: 10),
                                new Text("Ahmed Tahiri"),
                              ].toList(),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ));
      },
    );
  }

  Widget _reviewSection() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            margin: EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
            child: new Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6, right: 5, left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 03.60,
                          spreadRadius: 0.10),
                    ],
                  ),
                  height: (string.length / 33) < 10
                      ? (string.length / 33) * 30 + 50
                      : (string.length / 33) >= 10
                          ? (string.length / 33) * 30
                          : (string.length / 33) > 13
                              ? (string.length / 33) * 10
                              : (string.length / 33) * 10,

                  // string.length-(string.length*0.1174)
                  // string.length-(string.length*0.2258)
                ),
                Positioned(
                  top: -30,
                  left: 30,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          color: Colors.black87,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: ExactAssetImage("images/profile.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 15,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "5 days ago",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        "name",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 75,
                  child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: new Text(
                        '$string',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      )),
                ),
              ],
            ));
      },
    );
  }

  Widget _projectSection(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 04.60,
                          spreadRadius: 0.10),
                    ],
              borderRadius: BorderRadius.circular(10),
              image: new DecorationImage(
                image: new ExactAssetImage(
                  "images/profile.jpg",
                ),
                fit: BoxFit.cover,
              )),
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Opacity(
                opacity: 0.5,
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  height: 50,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Hello",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
