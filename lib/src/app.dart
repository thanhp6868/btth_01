import 'package:flutter/material.dart';
import './resources/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.blue,
      ),
    );
  }
}
