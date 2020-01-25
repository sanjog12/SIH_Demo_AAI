import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_test2/Services/backdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LogInScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogInScreen();
  }
}

class _LogInScreen extends State<LogInScreen> {
  String _email;
  String _pass;
  final FirebaseMessaging _messaging = FirebaseMessaging();
  
  @override
  void initState(){
    super.initState();
    _messaging.getToken().then((token){
      print(token);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Login',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(top: 20.0),
//              child: user_image(),
//            ),
           
           
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email ID',
                ),
              ),
            ),
           
           
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _pass = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            
            
            Padding(
              padding: EdgeInsets.only(top: 40, left: 40, right: 40),
              child: RaisedButton(
                child: Text('LOG IN',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email, password: _pass)
                      .then((user) {
                    Navigator.of(context).pushReplacementNamed('/employ_page');
                  }).catchError((e) {
                    print(e);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToDo{
  final String email;

  ToDo(this.email);
  
}

class user_image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage aai_l = AssetImage('images/user.png');
    Image image = Image(image: aai_l);
    return Container(
      child: image,
    );
  }
}
