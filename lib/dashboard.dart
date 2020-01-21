import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dashboard();
  }
}

class _dashboard extends State<dashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
	    appBar: AppBar(
		    title: Text('Dashboard'),
	    ),
	    
	    body: Container(
		    child: Column(
			    children: <Widget>[
			    	Padding(
					    padding: EdgeInsets.only(),
					    child: Text('Signed in'),
				    ),
				    
				    Padding (
					    padding: EdgeInsets.only(),
					    child: RaisedButton(
						    child: Text('Sign out'),
						    color: Colors.red,
						    onPressed: (){
						    	FirebaseAuth.instance
									    .signOut()
									    .then((value) {
									    	Navigator.of(context).pushReplacementNamed('/homepage');
							    }).catchError((e) {
									    	print(e);
							    });
						    },
					    ),
				    ),
			    ],
		    ),
	    ),
    );
  }
}