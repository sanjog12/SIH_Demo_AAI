
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: user_image(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _email=value;
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
              padding: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
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
                  hintText: 'Passward',
                ),
                obscureText: true,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(),
              child: FlatButton(
                child: Text('Log In'),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _email, password: _pass)
                      .then((user){
                        Navigator.of(context).pushReplacementNamed('/dashboard');
                  });
                },
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
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
