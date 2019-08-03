import 'package:flutter/material.dart';
import 'package:nike_app/data/tempData.dart';
import 'package:nike_app/ui/home/sizeScroll.dart';

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  bool _favorited;

  PageController _ctrPageBox;
  PageController _ctrPageDetails;

  _toggleFavorite()
  {
    setState(() {
      _favorited = (_favorited ? false : true);
    });
  }

  @override
  void initState() {
    _favorited = false;
    _ctrPageBox = PageController(viewportFraction: 0.8);
    _ctrPageDetails = PageController(viewportFraction: 1.0);
    _ctrPageBox.addListener((){  
      _ctrPageDetails.animateToPage(_ctrPageBox.page.round(), duration: Duration(milliseconds: 150), curve: Curves.linear);
    });
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
                      onTap: () => _toggleFavorite(),
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