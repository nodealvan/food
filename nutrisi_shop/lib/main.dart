import 'package:flutter/material.dart';
import 'package:nutrisi_shop/bottom/final_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FinalView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
