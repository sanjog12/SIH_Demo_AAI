import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loginhome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginhome();
  }
}

class _loginhome extends State<loginhome> {
  FirebaseUser curentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCurrentuser();
  }

  void loadCurrentuser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.curentUser = user;
      });
    });
  }

  String _email() {
    return curentUser.email;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Card(
          color: Color(0xFFF5EEE5),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo, width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(top: 200, left: 20, right: 20),
          elevation: 10,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Name :                 ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          name(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Date of Birth :    ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          dob(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Designation :         ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          deg(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Field :                     ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          field(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Mobile Number :  ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          mob(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Address :               ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          address(context),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, bottom: 10, left: 100),
          child: user(),
        ),
      ],
    );
  }

  Widget name(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['name'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget dob(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['dob'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget field(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Field'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget deg(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Designation'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget mob(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Mobile Number'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget address(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('users').document(_email()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Address'],
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage aai_l = AssetImage('images/log.png');
    Image image = Image(image: aai_l);
    return Container(
      child: image,
    );
  }
}
