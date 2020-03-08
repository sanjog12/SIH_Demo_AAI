import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login_pages_navigation/qrscanned.dart';
import 'sign_up.dart';
import 'Log_In_Page.dart';
import 'employ_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Aftersplash(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => Aftersplash(),
        '/signup': (BuildContext context) => signup(),
        '/LogInScreen': (BuildContext context) =>LogInScreen(),
        '/employ_page':(BuildContext context) =>employ(),
      },
    );
    ;
  }
}
