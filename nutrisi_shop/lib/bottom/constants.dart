import 'package:flutter/material.dart';

import 'package:nutrisi_shop/bottom/size_config.dart';
import 'package:nutrisi_shop/homepage.dart';

List<Widget> screens = [
  const MyHomePage(),
  Container(
    color: Colors.white,
    child: const Center(
      child: Text(
        'Masih Kosong',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
  Container(
    color: Colors.white,
    child: const Center(
      child: Text(
        'Kaya Hati:)',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
  Container(
    color: Colors.white,
    child: const Center(
      child: Text(
        'wkwkwk',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
  Container(
    color: Colors.white,
    child: const Center(
      child: Text(
        'Hehe',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 5.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 22.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 39.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 56.5;
    case 4:
      return AppSizes.blockSizeHorizontal * 73.5;
    default:
      return 0;
  }
}

final List<Color> gradient = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];
