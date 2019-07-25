import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/homeBottom.dart';

import 'homeBottomButton.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          titleSpacing: 0.0,
          title: 
          Image.network(
            // nike "https://i.imgur.com/ALRk9y6.png",
            "https://i.imgur.com/4akrVvG.png",
            fit: BoxFit.fitHeight,
            color: Colors.grey.shade800,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey.shade800,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pop(context);
              print("Back arrow pressed!");
            },
          ),
          //actions: <Widget>[],
        ),
      ),
      body: Stack(
        children: <Widget>[
          HomeBottom(),
          HomeBottomButton(),
        ],
      )
    );
  }
}
