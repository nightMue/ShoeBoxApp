import 'package:flutter/material.dart';

class HomeBottomButton extends StatelessWidget {
  _shopFuntion(){
    print("Shop button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () => _shopFuntion(),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade800,
            ),
            child: Icon(Icons.shop, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
