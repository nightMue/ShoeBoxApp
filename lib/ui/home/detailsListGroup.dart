import 'package:flutter/material.dart';
import 'package:nike_app/data/tempData.dart';

class DetailsListGroup extends StatefulWidget {
  @override
  _DetailsListGroupState createState() => _DetailsListGroupState();
}

/// Might need to put this into the homeBottom.dart so that the controllers for 
/// each detail item will be affected from the box controller when scrolled

class _DetailsListGroupState extends State<DetailsListGroup> {
  PageController _ctrPageDetails;

  @override
  void initState() {
    _ctrPageDetails = PageController(viewportFraction: 1.0);
    //_ctrPageBox.addListener((){  
    //  _ctrPageDetails.animateToPage(_ctrPageBox.page.round(), duration: Duration(milliseconds: 150), curve: Curves.linear);
    //});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _ctrPageDetails,//PageController(viewportFraction: 0.8),
        itemCount: adidasDetails.length,
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItemDetail(context, itemIndex);
        },
      ),
    );
  }

  Widget _buildCarouselItemDetail(BuildContext context, int itemIndex) {
    return adidasDetails[itemIndex];
  }
}