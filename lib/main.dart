import 'package:covidtracker/screens/SignUp.dart';
import 'package:covidtracker/screens/Start.dart';
import 'package:covidtracker/screens/Start2.dart';
import 'package:covidtracker/screens/login.dart';
import 'package:covidtracker/screens/login2.dart';

import 'package:firebase_core/firebase_core.dart';

import './screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
     routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "Login2" : (BuildContext context)=>Login2(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
        "start2":(BuildContext context)=>Start2(),
      },
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);
}
