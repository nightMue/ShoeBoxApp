import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/boxes/shoe.dart';

class ShoeBox extends StatefulWidget {
  ShoeBox(this.type, this.tempColor, this.imgLink, this.theShoe);

  final String type;
  final Color tempColor;
  final String imgLink;
  final Shoe theShoe;

  @override
  _ShoeBoxState createState() =>
      _ShoeBoxState(type, tempColor, imgLink, theShoe);
}

class _ShoeBoxState extends State<ShoeBox> {
  final String type;
  final Color tempColor;
  final String imgLink;
  final Shoe theShoe;
  
  _ShoeBoxState(this.type, this.tempColor, this.imgLink, this.theShoe);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width - 50,
      child: Container(
        child: Center(
          child: Container(
            child: Image.network(imgLink, height: 250, width: 350),
          ),
        ),
      ),
    );

  }
}
