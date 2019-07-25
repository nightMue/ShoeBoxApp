import 'package:flutter/material.dart';

class SizeScroll extends StatefulWidget {
  @override
  _SizeScrollState createState() => _SizeScrollState();
}

class _SizeScrollState extends State<SizeScroll> {
  bool _stared;

  void toggleStar() {
    setState(() {
      _stared = (_stared ? false : true);
    });
  }

  List<double> sizes = [4.0, 4.5, 6.0, 8.5, 9.0, 10.0];

  @override
  void initState() {
    _stared = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: GestureDetector(
        onTap: () => toggleStar(),

        child: Container(
          height: 65,
          width: 65,
          child: Stack(
          children: <Widget>[
            Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              shape: BoxShape.circle,
              // rating implementation
              //color: (_stared ? Colors.amber : Colors.white),
              // size implementation'
              color: Colors.white,
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    // rating implementation (star)
                    //child: (_stared ? Icon(Icons.star,color: Colors.amber,size: 15.0,): Icon(Icons.star,color: Colors.white,size: 15.0,)),
                    // avalible implementation (checkmark)
                    child: (_stared ? Icon(Icons.check_circle_outline, color: Colors.green.shade700, size: 15.0,) : Icon(Icons.not_interested, color: Colors.red, size: 15.0,)),
                  ),
                ),
                // This is for the ratining
                //Center(child: Text("4.3"),),
                //SizeScroll(),
              ],
            )),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 65,
                  width: 65,
                  child: Center(
                    child:Text(
                      sizes[index].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        )
      ),
    ));
  }
}
