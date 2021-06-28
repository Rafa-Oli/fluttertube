import 'package:flutter/material.dart';
import 'package:fluttertube/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutteTube',
      home: Home(),
    );
  }
}
