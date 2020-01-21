import 'package:flutter/material.dart';
import 'package:sih_test2/homepage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'homepage.dart';
import 'sign_up.dart';
import 'Log_In_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Aftersplash(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => Aftersplash(),
        '/signup': (BuildContext context) => signup(),
        '/LogInScreen': (BuildContext context) =>LogInScreen()
      },
    );
    ;
  }
}

class splashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _splashScreen();
  }
}

class _splashScreen extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      backgroundColor: Colors.blue,
      seconds: 16,
      title: Text('AAI'),
      navigateAfterSeconds: Aftersplash(),
      loadingText: Text(
        'Loading',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      loaderColor: Colors.red,
    );
  }
}
