import 'package:e_commerce/pages/home_pages.dart';
import 'package:e_commerce/pages/exploration_pages.dart';
import 'package:e_commerce/pages/details_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),
        "/Exploration": (context) => ExplorationPage(),
        "/Details": (context) => DestinationDetails(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false, //enlever la banière de debegage
    );
  }
}
