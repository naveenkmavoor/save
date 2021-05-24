import 'dart:math';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:save_lives/appbar.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  static const String route = '/home';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    fetchfromserver();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBar(),
        body: SizedBox.expand(
          child: Stack(
            children: [
              FutureBuilder<Map<String, dynamic>>(
                  future: fetchfromserver(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    }

                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                                title: Text(snapshot.data[index].name)),
                          );
                        },
                        itemCount: snapshot.data.length,
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ));
  }
}

//  ListView(
//             children: [
//               ListTile(
//                 title: Text('Hello'),
//               ),
//               Divider(
//                 color: Color(0xffa9a9b3),
//                 thickness: 0.25,
//               ),
//             ],
//             padding: EdgeInsets.symmetric(
//                 horizontal: pow((screenSize.width / 79), 2) as double),
//           ),

Future<Map<String, dynamic>> fetchfromserver() async {
  var url = Uri.parse("http://localhost:8083/case");
  Map<String, dynamic> responsevalue = {};
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);

    // responsevalue = convert.json.decode(response.body);
  }
  return responsevalue;
}
