
import 'package:covidtracker/screens/Start2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignUp2 extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp2> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  navigateToStart() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Start2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    )),
	                  
	                  Positioned(
	                     child:Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                   Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Form( key: _formKey,
	                      child: Column(
	                        children: <Widget>[
                             Container(
	                            padding: EdgeInsets.all(8.0),
	                            decoration: BoxDecoration(
	                              border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                            ),
                             // ignore: missing_return
	                            child: TextFormField(validator: (input) {
                            if (input.isEmpty) return 'Enter name';
                          },
                                onSaved: (input) => _name = input,
	                              decoration: InputDecoration(
	                                border: InputBorder.none,
	                                hintText: "Name ",
	                                hintStyle: TextStyle(color: Colors.grey[400])
	                              ),
	                            ),
	                          ),
	                          Container(
	                            padding: EdgeInsets.all(8.0),
	                            decoration: BoxDecoration(
	                              border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                            ),
                             // ignore: missing_return
	                            child: TextFormField(validator: (input) {
                            if (input.isEmpty) return 'Enter Email';
                          },
                                onSaved: (input) => _email = input,
	                              decoration: InputDecoration(
	                                border: InputBorder.none,
	                                hintText: "Email ",
	                                hintStyle: TextStyle(color: Colors.grey[400])
	                              ),
	                            ),
	                          ),
	                          Container(
	                            padding: EdgeInsets.all(8.0),
                             // ignore: missing_return
	                            child: TextFormField(validator: (input) {
                            if (input.length < 6)
                              return 'Provide Minimum 6 Character';
                          },
                                onSaved: (input) => _password = input,
	                              decoration: InputDecoration(
	                                border: InputBorder.none,
	                                hintText: "Password",
	                                hintStyle: TextStyle(color: Colors.grey[400])
	                              ),
	                            ),
	                          )
	                        ],
	                      ),
	                    ),
	                  ),
	                  SizedBox(height: 30,),
	                   Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
	                  child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed:signUp,
                      child: Text('SIGNUP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
	                  ),
	                  SizedBox(height: 30,),
	                 GestureDetector(onTap: navigateToStart,
                     child: Text("go to main menu", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
}

