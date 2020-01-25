import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sih_test2/Services/backdata.dart';

class UserManagement{
	
//	void getuid() async{
//		final FirebaseUser u = await FirebaseAuth.instance.currentUser().then((FirebaseUser u){
//			final String  email = u.email;
//		},);
//	}
	
	storeNewUser(user,email,name,dob,context){
		Firestore.instance.collection('/users').document(email).setData({
			'email':email,
			'name':name,
			'dob':dob,
		}).then((value){
			Navigator.of(context).pop();
		}).catchError((e){
			print(e);
		});
	}
}
