import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _notification();
  }
}

class _notification extends State<notification> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('Notification Sections',style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),),
        ),
        
        Padding(
          padding: EdgeInsets.only(top: 200,left: 30),
          child: Text('Coming Soon....',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.lime
          ),),
        )
        
      ],
    );
  }
}
