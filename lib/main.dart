import 'package:flutter/material.dart';
import 'package:save_lives/homepage.dart';
import 'package:save_lives/theme/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData( context),
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}
