import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Scroll demo',
      home: new Scaffold(
        appBar: new AppBar(elevation: 0.0),
        body: new CustomScroll(),
      ),
    );
  }
}

class CustomScroll extends StatefulWidget {
  @override
  State createState() => new CustomScrollState();
}

class CustomScrollState extends State<CustomScroll> {
  ScrollController scrollController;
  double offset = 0.0;
  static const double kEffectHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
         
        new Container(
          color: Colors.blue,
          height: (kEffectHeight - offset * 0.5).clamp(0.0, kEffectHeight),
        ),
       new Positioned(
          top:30,
          child: new Container(
            width: 200.0,
            child: new ListView.builder(
              itemCount: 100,
              itemBuilder: buildListItem,
              controller: scrollController,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    return new Container(color: Colors.white, child: new Text('Item $index'));
  }

  void updateOffset() {
    setState(() {
      offset = scrollController.offset;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(updateOffset);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(updateOffset);
  }
}
