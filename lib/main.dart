import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xffF8F8FE),
        accentColor: Color(0xff5F47E1),
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
