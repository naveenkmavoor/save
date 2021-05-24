import 'dart:math';

import 'package:flutter/material.dart';
import 'package:save_lives/appbar.dart';

class Homepage extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBar(),
        body: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            children: [
              ListTile(
                title: Text('Hello'),
              ),
              Divider(
                color: Color(0xffa9a9b3),
                thickness: 0.25,
              ),
            ],
            padding: EdgeInsets.symmetric(
                horizontal: pow((screenSize.width / 79), 2) as double),
          ),
        ));
  }
}
