import 'package:flutter/material.dart';
import 'package:nike_app/data/tempData.dart';

class HomeBottomDetails extends StatefulWidget {
  @override
  _HomeBottomDetailsState createState() => _HomeBottomDetailsState();
}

class _HomeBottomDetailsState extends State<HomeBottomDetails> {
  ScrollController _ctrScroll;
  
  _scrollListener() {
    double itemSize = MediaQuery.of(context).size.width - 50;

    // commented out code on mobile base station
  }

  @override
  void initState() {
    _ctrScroll = ScrollController();
    _ctrScroll.addListener(_scrollListener);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.transparent,
      child: ListView.builder(
        controller: _ctrScroll,
        scrollDirection: Axis.horizontal,
        itemCount: adidasBoxes.length,
        itemBuilder: (context, index) {
          return adidasDetails[index];
        },
      ),
    );
  }
}