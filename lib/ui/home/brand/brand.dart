import 'package:flutter/material.dart';

class Brand extends StatefulWidget {
  Brand(this.name, this.imgURL);
  final String name;
  final String imgURL;

  @override
  _BrandState createState() => _BrandState(name, imgURL);
}

class _BrandState extends State<Brand> {
  final String name;
  final String imgURL;
  _BrandState(this.name, this.imgURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: Colors.grey.shade400,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            )
          ),
          //Image.network(imgURL, scale: 0.5,),
        ],
      )
    );
  }
}