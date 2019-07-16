import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shoe Box",
      theme: ThemeData(backgroundColor: Color(0xffe7e9f0), fontFamily: 'Raleway'),
      home: Home(title: "Shoe Box",),
    );
  }
}