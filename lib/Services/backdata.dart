import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class backdata{
	getBack(String user ){
		return Firestore.instance
				.collection('users')
				.document(user)
				.get()
				.then((DocumentSnapshot){
					
		});
	}
}