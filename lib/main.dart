import 'package:facebook/screens/home_screen.dart';
import 'package:facebook/screens/nav_screen.dart';
import 'package:flutter/material.dart';

import 'constants/color_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: ColorRepository.scaffold,
      ),
      // ignore: prefer_const_constructors
      home: NavScreen(),
    );
  }
}
