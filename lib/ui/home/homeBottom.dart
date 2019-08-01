import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/boxes/shoe.dart';
import 'package:nike_app/ui/home/boxes/shoeBox.dart';
import 'package:nike_app/data/tempData.dart';
import 'package:nike_app/ui/home/homeBottomDetails.dart';
import 'package:nike_app/ui/home/sizeScroll.dart';

import 'package:rect_getter/rect_getter.dart';

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  bool _favorited;
  bool _stared;

  double _prefScrollLocation;
  int _currentIndex;
  List<double> boxOffsets; 

  ScrollController _ctrScroll;
  ScrollController _ctrScrollDetails;

  PageController _ctrPageBox;
  PageController _ctrPageDetails;

  _onStartScroll(ScrollMetrics metrics) {

  }

  _onUpdateScroll(ScrollMetrics metrics) {

  }

  _onEndScroll(ScrollMetrics metrics) {
    double offset = _ctrScroll.offset;
    if(_prefScrollLocation < offset)
    {
      //_moveRight();
    }
    else
    {
     // _moveLeft();
    }
    _prefScrollLocation = offset;
    _moveToItem(offset);
  }

  _moveRight()
  {
    print("Scrolling Right");
    if(_currentIndex != boxOffsets.length - 1)
    {
      _currentIndex = _currentIndex + 1;
      _ctrScroll.animateTo(
        //boxOffsets[_currentIndex], 
        (MediaQuery.of(context).size.width - 50) * _currentIndex,
        duration: Duration(milliseconds: 100), 
        curve: Curves.linear
      );
      _ctrScrollDetails.animateTo(
        //boxOffsets[_currentIndex], 
        (MediaQuery.of(context).size.width - 50) * _currentIndex,
        duration: Duration(milliseconds: 100), 
        curve: Curves.linear
      );
    }
  }

  _moveLeft()
  {
    print("Scrolling left");
    if(_currentIndex != 0)
    {
      _currentIndex = _currentIndex - 1;
      _ctrScroll.animateTo(
        //boxOffsets[_currentIndex],
        (MediaQuery.of(context).size.width - 50) * _currentIndex,
        duration: Duration(milliseconds: 100), 
        curve: Curves.linear
      );
      _ctrScrollDetails.animateTo(
        //boxOffsets[_currentIndex], 
        (MediaQuery.of(context).size.width - 50) * _currentIndex,
        duration: Duration(milliseconds: 100), 
        curve: Curves.linear
      );
    }
  }

  _moveToItem(double offset)
  {
    for(var i = 1; i < boxOffsets.length; i++)
    {
      double small = boxOffsets[i-1];
      double big = boxOffsets[i];

      if(offset > small && offset < big)
      {
        //print(i-1);
        _ctrScrollDetails.animateTo(
          boxOffsets[i-1],
          duration:Duration(milliseconds: 100), 
          curve: Curves.linear);
      }
    }
  }

  _scrollListener() {

  }

  _scrollListenerDetails() {

  }

  void toggleFavorite()
  {
    setState(() {
     _favorited = (_favorited ? false : true);
    });
  }

  void toggleStar()
  {
    setState(() {
      _stared = (_stared ? false : true) ;
    });
  }

  @override
  void initState() {
    _ctrScroll = ScrollController();
    _ctrScroll.addListener(_scrollListener);
    _ctrScrollDetails = ScrollController();
    _ctrScrollDetails.addListener(_scrollListenerDetails);
    boxOffsets = List<double>();
    _prefScrollLocation = 0.0;
    _currentIndex = 0;
    _favorited = false;
    _stared = false;
    _ctrPageBox = PageController(viewportFraction: 1.0);
    _ctrPageDetails = PageController(viewportFraction: 1.0);
    _ctrPageBox.addListener((){  
      _ctrPageDetails.animateToPage(_ctrPageBox.page.round(), duration: Duration(milliseconds: 150), curve: Curves.linear);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width-50;
    for(var i = 0; i < adidasBoxes.length; i++)
    {
      boxOffsets.add(i*width);
    }
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
            /*Container(
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
                  itemCount: adidasBoxes.length,
                  itemBuilder: (context, index) {
                    return adidasBoxes[index];
                  },
                ),
              ),
            ),*/

            Container(
              height: 320,
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 320,
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _ctrPageBox,//PageController(viewportFraction: 0.8),
                      itemCount: adidasBoxes.length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return _buildCarouselItemBox(context, itemIndex);
                      },
                    ),
                  )
                ],
              ),
            ),

            // cant use this with same scroll controller
            // move listview out to here and use same controller as above
            // ----------------
            // HomeBottomDetails(),
            // ----------------
            /*Container(
              height: 150,
              color: Colors.transparent,
              child: ListView.builder(
                controller: _ctrScrollDetails,
                scrollDirection: Axis.horizontal,
                itemCount: adidasDetails.length,
                itemBuilder: (context, index) {
                  return adidasDetails[index];
                },
              ),
            ),*/

            Container(
              height: 150,
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _ctrPageDetails,//PageController(viewportFraction: 0.8),
                      itemCount: adidasDetails.length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return _buildCarouselItemDetail(context, itemIndex);
                      },
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: 100,
              color:Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizeScroll(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: GestureDetector(
                      onTap: () => toggleFavorite(),
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: (_favorited ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border, color: Colors.grey.shade800,)),
                      ),
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

  Widget _buildCarouselItemDetail(BuildContext context, int itemIndex) {
    /*return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Center(
          child: Text(itemIndex.toString()),
        ),
      ),
    );*/
    return adidasDetails[itemIndex];
  }

  Widget _buildCarouselItemBox(BuildContext context, int itemIndex) {
    /*return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Center(
          child: Text(itemIndex.toString()),
        ),
      ),
    );*/
    return adidasBoxes[itemIndex];
  }
}