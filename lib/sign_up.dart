import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  String _cpass;
  String _name;
  String _dob;
  FirebaseUser signedInUser;
  
  
  bool check(){
    if(_cpass==_pass){
      return true;
    }
    
    else {
      return false;
    }
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            
            
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
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
                  labelText: 'Enter your unique user ID',
                ),
              ),
            ),
            
            
            
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
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
                  icon: Icon(Icons.lock),
                  labelText: 'Set your login password Password',
                ),
              ),
            ),
  
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 80.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _cpass = value;
                  });
                  check();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Confirm your password again ',
                ),
              ),
            ),
            
            
            
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  
                ),
              ),
            ),
            
            
            
  
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _dob = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter your Date of Birth',
                ),
              ),
            ),
 
           
            Padding(
                padding: EdgeInsets.only(top: 30,left: 60,right: 60),
                child: RaisedButton(
                  elevation: 5.0,
                  child: Text('Sign Up',style: TextStyle(
                    color: Colors.white,
                  ),),
                  color: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email,
                      password: _pass,
                    )
                        .then((signedInUser) {
                          UserManagement().storeNewUser(signedInUser,_email,_name,_dob, context);

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
