import 'package:flutter/material.dart';
import 'screens/gold_price_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold Price',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GoldPricePage(),
    );
  }
}
