import 'package:flutter/material.dart';

class ShoeBoxDetail extends StatefulWidget {
  ShoeBoxDetail(this.category, this.name, this.price);

  final String category;
  final String name;
  final String price;

  @override
  _ShoeBoxDetailState createState() => _ShoeBoxDetailState(category, name, price);
}

class _ShoeBoxDetailState extends State<ShoeBoxDetail> {
  final String category;
  final String name;
  final String price;

  _ShoeBoxDetailState(this.category, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 50,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Text(
            category,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            name,
            style: TextStyle(
                fontSize: 35.0,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.0),
          Text(
            price,
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
