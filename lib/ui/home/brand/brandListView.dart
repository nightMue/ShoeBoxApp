import 'package:flutter/material.dart';
import 'package:nike_app/data/tempData.dart';
import 'package:nike_app/ui/home/brand/brand.dart';
import 'package:nike_app/ui/home/home.dart';

class BrandListView extends StatefulWidget {
  @override
  _BrandListViewState createState() => _BrandListViewState();
}

class _BrandListViewState extends State<BrandListView> {
  ScrollController _ctrBrandsScroll;

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
            "https://i.imgur.com/E4Z4b0x.jpg",
            fit: BoxFit.fitHeight,
            //color: Colors.grey.shade800,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade800,
              size: 35.0,
            ),
            onPressed: () {
              print("Search Arrow Pressed");
            },
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _ctrBrandsScroll,
            scrollDirection: Axis.vertical,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              var item = brands[index];
              return GestureDetector(
                child: brands[index],
                onTap: () => onTapped(item),
              );
            },
          )
        ],
      ),
    );
  }

  void onTapped(Brand item)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(title: item.name)));
  }
}