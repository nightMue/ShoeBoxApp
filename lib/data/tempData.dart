import 'package:flutter/material.dart';
import 'package:nike_app/ui/home/boxes/shoe.dart';
import 'package:nike_app/ui/home/boxes/shoeBox.dart';
import 'package:nike_app/ui/home/boxes/shoeBoxDetail.dart';
import 'package:nike_app/ui/home/brand/brand.dart';

List<ShoeBox> adidasBoxes = [
  ShoeBox("Adidas 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 1", false)),
  ShoeBox("Adidas 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 2", false)),
  ShoeBox("Adidas 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 3", false)),
  ShoeBox("Adidas 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 4", false)),
  ShoeBox("Adidas 1", Colors.red, "https://i.imgur.com/vCE8LAw.png", Shoe("Nike 5", false))
];

List<ShoeBoxDetail> adidasDetails = [
  ShoeBoxDetail("Mens Shoe", "Shoe 1",  "\$125"),
  ShoeBoxDetail("Mens Shoe", "Shoe 2",  "\$135"),
  ShoeBoxDetail("Womens Shoe", "Shoe 3",  "\$145"),
  ShoeBoxDetail("Womens Shoe", "Shoe 4",  "\$155"),
  ShoeBoxDetail("Mens Shoe", "Shoe 5",  "\$165")
];

List<Brand> brands = [
  Brand("Adidas", "https://i.imgur.com/4akrVvG.png"),
  Brand("Nike" , "https://i.imgur.com/4akrVvG.png"),
  Brand("Puma", "https://i.imgur.com/4akrVvG.png"),
  Brand("New Balance", "https://i.imgur.com/4akrVvG.png"),
  Brand("ReeBook", "https://i.imgur.com/4akrVvG.png"),
  Brand("Adidas", "https://i.imgur.com/4akrVvG.png"),
  Brand("Nike" , "https://i.imgur.com/4akrVvG.png"),
  Brand("Puma", "https://i.imgur.com/4akrVvG.png"),
  Brand("New Balance", "https://i.imgur.com/4akrVvG.png"),
  Brand("ReeBook", "https://i.imgur.com/4akrVvG.png")
];