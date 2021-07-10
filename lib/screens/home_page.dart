import 'package:covidtracker/screens/comments.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';

import 'Account.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;



  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start2");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }
  
  signOut() async {
    _auth.signOut();

    
  }

   @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    
  }

  navigateToAccount() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Account()));
  }
  navigateToComments() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
       centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("Logged in as  ${user.displayName}"),
      
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
        children:<Widget> [
            DrawerHeader(
              
            decoration: BoxDecoration(
          color: Colors.blue,
          
            
          ), child: null,
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Account"),
            onTap:navigateToAccount
           
            
          ),
          ListTile(
            leading: Icon(Icons.comment),
            title: Text("add comment"),
            onTap:navigateToComments
           
            
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: (){
              showDialog(context: context, builder:(BuildContext context)=>AlertDialog(title: Text("log out"),content: Text("sure?"),
              actions: [
               ElevatedButton(onPressed:signOut, child: Text("yes")),
               ElevatedButton(onPressed:(){Navigator.pop(context);}, child: Text("No")),

              ],
              ),
              );
            },
          ),
          
        ],  
        ),
        ),


      body: HomeCategories(),
    );
  }
}
