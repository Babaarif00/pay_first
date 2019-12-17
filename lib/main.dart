import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(PayFirst());

class PayFirst extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay First',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: new MyLoginPage(),
    );
  }
}

