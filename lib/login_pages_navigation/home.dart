import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class loginhome extends StatefulWidget{
	
	
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginhome();
  }
}

class _loginhome extends State<loginhome>{
	FirebaseUser curentUser;
	@override
	void initState() {
    // TODO: implement initState
    super.initState();
    loadCurrentuser();
  }
	void loadCurrentuser(){
		FirebaseAuth.instance.currentUser().then((FirebaseUser user){
			setState(() {
			 this.curentUser=user;
			});
		});
	}
	
	String _email(){
		return curentUser.email;
	}
	
	
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
	    child: Column(
		    children: <Widget>[
		    	Padding(
				    padding : EdgeInsets.only(),
				    child: Column(
					    children: <Widget>[
					    	Row(
							    children: <Widget>[
							    	Text('Name :     '),
								    name(context),
								    
							    ],
						    )
					    ],
				    )
			    ),
			    
			    
			    Padding (
				    padding: EdgeInsets.only(top: 10,left: 40.0,right: 40.0),
				    child: RaisedButton(
					    child: Text('Sign Out',style: TextStyle(
						    color: Colors.orangeAccent,
					    ),),
					    
					    shape: RoundedRectangleBorder(
						    borderRadius: BorderRadius.circular(10.0),
					    ),
					    
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
    );
  }
  
  Widget name(BuildContext context){
  	return StreamBuilder(
		  stream: Firestore.instance.collection('users').document(_email()).snapshots(),
	    builder: (context, snapshot){
		  	if(!snapshot.hasData){
		  		return Text("Loading");
			  }
		  	var userD = snapshot.data;
		  	return Text(userD['name']);
	    },
	  );
  }
	
}