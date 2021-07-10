import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

 

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login2");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage("assets/corona.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'COVID-19 Tracker',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow))
                ])),
            SizedBox(height: 10.0),
            Text(
              'A covid tracker application',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToLogin,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.red),
                SizedBox(width: 20.0),
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToRegister,
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.red),
              ],
            ),
            SizedBox(height: 20.0),
    
          ],
        ),
      ),
    );
  }
}