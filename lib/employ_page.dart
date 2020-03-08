import 'package:barcode_scan/barcode_scan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_test2/login_pages_navigation/home.dart';
import 'package:sih_test2/login_pages_navigation/notifications.dart';

import 'login_pages_navigation/qrscanned.dart';

class employ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _employ();
  }
}

class _employ extends State<employ> {
  String code = " ";

  PageController _pageController;
  GlobalKey __bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ))
        ],
        title: Text('Employee dash board'),
        backgroundColor: Colors.lime,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          loginhome(),
          notification(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        tooltip: 'QR Scanner',
        elevation: 3,
        backgroundColor: Color(0xFF111DAD),
        onPressed: () {
          Qrscan();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      
      bottomNavigationBar: CurvedNavigationBar(
        key: __bottomNavigationKey,
        color: Colors.lime,
        index: 0,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.lime,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.assignment_ind,
            size: 20,
            color: Colors.white,
            semanticLabel: 'Employee Details',
          ),
          Icon(
            Icons.notifications,
            size: 20,
            color: Colors.white,
            semanticLabel: 'Notifications',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }

  Qrscan() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        code = result;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> qrscanned(code)));
    } catch (e) {
      print(e);
    }
  }
}
