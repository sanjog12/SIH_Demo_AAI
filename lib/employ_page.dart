import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class employ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _employ();
  }
}

class _employ extends State<employ>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
	    appBar: AppBar(
		    title: Text('Employee dash board'),
	    ),
	    
	    
	    bottomNavigationBar: CurvedNavigationBar(
		    color: Colors.lightBlue,
		    backgroundColor: Colors.white,
		    buttonBackgroundColor: Colors.white,
		    height: 50,
		    items: <Widget>[
		    	Icon(Icons.assignment_ind,size: 20,color: Colors.black,semanticLabel: 'Employee Details',),
			    Icon(Icons.fullscreen,size: 20,color: Colors.black,semanticLabel: 'Q R Scanner',)
		    ],
		    onTap: (value){},
	    ),
    );
  }
	
}