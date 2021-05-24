import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(68);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  void initState() {
    fetchfromserver();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 68,
      titleSpacing: pow((screenSize.width / 79), 2),
      title: Row(
        children: [
          Text(
            'Save Lives Dashboard',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchfromserver() async {
  var url = Uri.parse("http://localhost:8083/case");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
  }
}
