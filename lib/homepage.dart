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
//				decoration: BoxDecoration(
//					gradient: LinearGradient(colors: [const Color(0xFF030891),const Color(0xFFDBCFD7) ],
//					begin: FractionalOffset.topLeft,
//					end: FractionalOffset.bottomRight,
//					stops: [0.0,1.0],
//					)
//				),

        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/try2.jpg',
                width: 500,
                height: 750,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 10), 
                  child: Text(
                    'Airport Authority \n       of India', 
                    style: TextStyle(
                      fontSize: 50, 
                      fontWeight: FontWeight.w700, 
                      fontStyle: FontStyle.italic, 
                      textBaseline: TextBaseline.ideographic, 
                      color: Colors.white,
                    ),
                  ),
                )
            ),
            
            
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 600, left: 30),
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        animationDuration: Duration(seconds: 2),
                        child: Text(
                          "LOG IN",
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
                        color: Colors.orangeAccent,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/LogInScreen');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 600, left: 20),
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                          animationDuration: Duration(seconds: 2),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                  color: Colors.orangeAccent, width: 3.0)),
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
    AssetImage aai_l = AssetImage(
      'images/civil1.png',
    );
    Image image = Image(image: aai_l);
    return Container(
      child: image,
    );
  }
}
