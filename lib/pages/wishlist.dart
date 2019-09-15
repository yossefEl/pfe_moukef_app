import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: new AppBar(
          leading: new IconButton(
            onPressed:(){
              Navigator.of(context).pop();
            },
            icon:Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )
          ),
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              Scaffold.of(context).showSnackBar(SnackBar(
                  action: SnackBarAction(
                    label: "REDO",
                    onPressed: () {
                      setState(() {
                        items.insert(index, item);
                      });
                    },
                  ),
                  backgroundColor: Colors.black,
                  content: Container(
                      color: Colors.black,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "User number $item removed from wishlist",
                        style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: "Montserrat"),
                      ))));
            },
            background: Container(color: Colors.red),
            child: Container(
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
                    ? new EdgeInsets.only(top: 20, bottom: 5, right: 7, left: 7)
                    : new EdgeInsets.only(top: 5, bottom: 5, right: 7, left: 7),
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
                              "$item",
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
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
