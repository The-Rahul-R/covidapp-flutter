import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';
import 'SignUp2.dart';
import 'login2.dart';


class Start2 extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start2> {
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
       backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("This app provides awareness about covid 19 and world stats ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,

                  ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/corona.png")
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                     color: Color(0xff0095FF),
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login2()));

                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                         color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp2()));

                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  )

                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}