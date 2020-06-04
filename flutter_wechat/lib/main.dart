import 'package:flutter/material.dart';
import 'package:flutterwechat/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wechat',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        highlightColor: Color.fromRGBO(0, 0, 0, 0),
        splashColor: Color.fromRGBO(0, 0, 0, 0),
      ),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
