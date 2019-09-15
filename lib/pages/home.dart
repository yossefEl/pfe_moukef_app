import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'profile_art.dart';
import 'catergorie.dart';
import 'wishlist.dart';
import 'project.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
    TabController _tabController;
  var currentPage;
  var catStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  var artInfoStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 12,
  );

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TitledBottomNavigationBar(
        activeColor: Colors.amber,
        inactiveColor: Colors.black26,
        indicatorColor: Colors.black87,
          onTap: (index) {
            if(index==3)
            {
                 Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WishList()));
            }
            if(index==4)
            {
                 Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Project()));
            }
            print("Selected Index: $index");
          },
          items: [
            TitledNavigationBarItem(title: 'Home', icon: Icons.home),
            TitledNavigationBarItem(title: 'Search', icon: Icons.search),
            TitledNavigationBarItem(title: 'Bag', icon: Icons.card_travel),
            TitledNavigationBarItem(title: 'Orders', icon: Icons.shopping_cart),
            TitledNavigationBarItem(
                title: 'Profile', icon: Icons.person_outline),
          ]),
      appBar: AppBar(
        centerTitle: true,
        title: new Image.asset(
          "images/logo.png",
          height: 25,
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          unselectedLabelColor: Colors.black26,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.person),
              text: "Individual",
            ),
            new Tab(
              icon: new Icon(Icons.group),
              text: "Company",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        children: [_buildTab(), _buildTab()],
        controller: _tabController,
      ),
    );
  }

  Widget _buildTab() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          margin: EdgeInsets.only(top: 6, bottom: 6, right: 10, left: 10),
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
          height: 200,
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Container(
                      padding: new EdgeInsets.only(left: 15),
                      child: new Text(
                        "Categorie",
                        style: catStyle,
                      )),
                  Spacer(),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    child: new IconButton(
                        onPressed: () {
                            Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Categorie()));
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 25,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                            Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileArtisan()));
                          
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                      "images/profile.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.all(5),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: new Text(
                                "Name",
                                style: artInfoStyle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: new Text(
                                "Name",
                                style: artInfoStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
