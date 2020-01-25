import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_test2/login_pages_navigation/home.dart';
import 'package:sih_test2/login_pages_navigation/notifications.dart';

class employ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _employ();
  }
}

class _employ extends State<employ>{
	
	PageController _pageController;
	GlobalKey __bottomNavigationKey = GlobalKey();
	
	@override
	void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =PageController();

  }
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
	    appBar: AppBar(
		    title: Text('Employee dash board'),
	    ),
	    
	    body: PageView(
		    controller: _pageController,
		    children: <Widget>[
		    	loginhome(),
			    notification(),
		    ],
		    
		    onPageChanged: (int index){
		    	setState(() {
		    	  _pageController.jumpToPage(index);
		    	});
		    },
	    ),
	    
	    floatingActionButton: FloatingActionButton(
		    c
	    ),
	    
	    bottomNavigationBar: CurvedNavigationBar(
		    key: __bottomNavigationKey,
		    color: Colors.lightBlue,
		    index: 0,
		    backgroundColor: Colors.white,
		    buttonBackgroundColor: Colors.lightBlue,
		    height: 50,
		    
		    items: <Widget>[
		    	Icon(Icons.assignment_ind,size: 20,color: Colors.black,semanticLabel: 'Employee Details',),
			    
			    Icon(Icons.fullscreen,size: 20,color: Colors.black,semanticLabel: 'Notifications',),
		    ],
		    onTap: (int index){
		    	setState(() {
		    	  _pageController.jumpToPage(index);
		    	});
		    },
		    
		    
	    ),
    );
  }
	
}