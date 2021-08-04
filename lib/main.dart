import 'package:flutter/material.dart';
import 'package:flutter_app1/detailpage.dart';
import 'package:flutter_app1/homepage.dart';
import 'package:flutter_app1/routeGanerate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage()
    );
  }
}