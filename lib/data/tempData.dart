import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/boxes/shoe.dart';
import 'package:nike_app/ui/home/boxes/shoeBox.dart';
import 'package:nike_app/ui/home/boxes/shoeBoxDetail.dart';

List<ShoeBox> boxes = [
  ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 1", false)),
  ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 2", false)),
  ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 3", false)),
  ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 4", false)),
  ShoeBox("Nike 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 5", false))
];

List<ShoeBoxDetail> details = [
  ShoeBoxDetail("Mens Shoe", "Shoe 1",  "\$125"),
  ShoeBoxDetail("Mens Shoe", "Shoe 2",  "\$135"),
  ShoeBoxDetail("Womens Shoe", "Shoe 3",  "\$145"),
  ShoeBoxDetail("Womens Shoe", "Shoe 4",  "\$155"),
  ShoeBoxDetail("Mens Shoe", "Shoe 5",  "\$165")
];