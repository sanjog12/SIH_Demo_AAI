import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_test2/Log_In_Page.dart';

class crudMethods{
	bool isLoggedIn(){
		if(FirebaseAuth.instance.currentUser()!=0){
			return true;
		}
		else {
			return false;
		}
	}
	
	Future<void> addData(userData) async {
		if(isLoggedIn()){
			Firestore.instance.collection('test').add(userData).catchError((e){
				print(e);},);
		}
		else {
			print("You need to logged in ");
		}
	}
	
	getData(user)async{
		return await Firestore.instance.collection('users').document('$user').get();
	}
}