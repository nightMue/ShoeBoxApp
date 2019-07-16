import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/boxes/shoe.dart';
import 'package:nike_app/ui/home/boxes/shoeBox.dart';

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  double _itemWidth;
  List<ShoeBox> boxes;
  ScrollController _ctrScroll;

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      print("Start") ;
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      print(metrics.extentAfter);
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      print("End");
    });
  }

  _scrollListener() {
    double itemSize = MediaQuery.of(context).size.width - 50;

    // commented out code on mobile base station
  }

  @override
  void initState() {
    _ctrScroll = ScrollController();
    _ctrScroll.addListener(_scrollListener);
    boxes = List<ShoeBox>();
    boxes.add(ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 1", false)));
    boxes.add(ShoeBox("Nike 2", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 2", false)));
    boxes.add(ShoeBox("Nike 3", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 3", false)));
    boxes.add(ShoeBox("Nike 4", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 4", false)));
    boxes.add(ShoeBox("Nike 5", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 5", false)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color:Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade300,
              Colors.white,
            ]
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          )
        ),
        margin: EdgeInsets.fromLTRB(25, 25, 25, 60),
        child: Column(
          children: <Widget>[
            Container(
              height: 320,
              color: Colors.transparent,
              //slider
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if(scrollNotification is ScrollStartNotification) {
                    _onStartScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollUpdateNotification) {
                    _onUpdateScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollEndNotification) {
                    _onEndScroll(scrollNotification.metrics);
                  }
                },
                child: ListView.builder(
                  controller: _ctrScroll,
                  scrollDirection: Axis.horizontal,
                  itemCount: boxes.length,
                  itemBuilder: (context, index) {
                    return boxes[index];
                  },
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text("MEN'S SHOE",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text("Adidas Shoe",
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text("\$170",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color:Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.star, color: Colors.white, size: 15.0,),
                            ),
                          ),
                          Center(child: Text("4.3"),),
                        ],
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.grey.shade800,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}