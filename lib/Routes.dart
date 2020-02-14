import 'package:flutter/material.dart';
import 'package:login_demo_firebase/screens/Home/index.dart';
import 'package:login_demo_firebase/screens/Login/index.dart';
import 'package:login_demo_firebase/screens/SignUp/index.dart';
import 'package:login_demo_firebase/theme/style.dart';


class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Flat App",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}
