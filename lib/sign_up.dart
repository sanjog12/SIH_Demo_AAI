import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_test2/Services/usermanagement.dart';
import 'Services/usermanagement.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _signup();
  }
}

class _signup extends State<signup> {
  String _email;
  String _pass;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  icon: Icon(Icons.assignment_ind),
                  hintText: 'User Id',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _pass = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  icon: Icon(Icons.assignment_ind),
                  hintText: 'PassWard',
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(),
                child: RaisedButton(
                  elevation: 5.0,
                  child: Text('Sign Up'),
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _email,
                      password: _pass,
                    )
                        .then((signedInUser) {
                      UserManagement().storeNewUser(signedInUser, context);
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
