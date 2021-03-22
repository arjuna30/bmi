import 'package:bmi/components/themes.dart';
import 'package:bmi/pages/input_page.dart';
import 'package:bmi/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        dialogTheme: DialogTheme(
          backgroundColor: primaryColor,
        ),
      ),
      home: InputPage(),
    );
  }
}
