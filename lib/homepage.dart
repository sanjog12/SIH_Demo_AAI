import 'package:flutter/material.dart';



class Aftersplash extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		// TODO: implement createState
		return _Aftersplash();
	}
}




class _Aftersplash extends State<Aftersplash> {
	
	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		return Scaffold(
			body: Container(
				child: ListView(
					children: <Widget>[
						
						Padding(
							padding: EdgeInsets.only(top: 10, left: 5, right: 5),
							child: india_gov_logo(),
						),
						
						
						
						Padding(
							padding: EdgeInsets.only(top: 150, left: 20, right: 20),
							child: SizedBox(
								width: 200.0,
								child: RaisedButton(
									animationDuration: Duration(seconds: 2),
									child: Text(
										"Login",
										style: TextStyle(
											fontSize: 20.0,
											color: Colors.white,
											fontWeight: FontWeight.w500,
										),
									),
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.circular(30.0),
									),
									elevation: 5.0,
									color: Colors.lightBlue,
									onPressed: () {
										Navigator.of(context).pushNamed('/LogInScreen');
									},
								),
							),
						),
						
						
						
						Padding(
							padding: EdgeInsets.only(top: 10, right: 20, left: 20),
							child: SizedBox(
								width: 200.0,
								child: RaisedButton(
										animationDuration: Duration(seconds: 2),
										child: Text(
											"Register",
											style: TextStyle(
												fontSize: 20.0,
												color: Colors.lightBlue,
												fontWeight: FontWeight.w500,
											),
										),
										shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(30.0),
												side: BorderSide(color: Colors.lightBlue, width: 3.0)),
										elevation: 5.0,
										color: Colors.white,
										onPressed: () {
											Navigator.of(context).pushNamed('/signup');
										}),
							),
						),
					],
				),
			),
		);
	}
}



class india_gov_logo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		AssetImage aai_l = AssetImage('images/image002 (1).png');
		Image image = Image(image: aai_l);
		return Container(
			child: image,
		);
	}
}