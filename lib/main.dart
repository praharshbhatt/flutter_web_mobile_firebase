import 'package:firebase/firebase.dart' as WebFirebase;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_web_firebase/screens/homeScreen.dart';
import 'package:mobile_web_firebase/screens/signin.dart';
import 'package:mobile_web_firebase/services/auth.dart';

//==================This file is the Splash Screen for the app==================
BuildContext _context;
AuthService authService;

void main() {
//  //For Web
  if (kIsWeb) {
    WebFirebase.initializeApp(
        apiKey: "AIzaSyDVUHUM29dmMO107B4Fk2fXSfobhgqOC4U",
        authDomain: "test-firebase-flutter-project.firebaseapp.com",
        databaseURL: "https://test-firebase-flutter-project.firebaseio.com",
        projectId: "test-firebase-flutter-project",
        storageBucket: "test-firebase-flutter-project.appspot.com",
        messagingSenderId: "822008284290",
        appId: "1:822008284290:web:50f09b2d30a022999da09b");
  }

  runApp(new MaterialApp(theme: ThemeData(primarySwatch: Colors.orange), home: new SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    //Call the Class constructor and initialize the object
    authService = new AuthService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
        body: Container(
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.clear, size: MediaQuery.of(context).size.width * 0.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This could have been a splash screen",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05)),
            )
          ],
        ),
      ),
    ));
  }
}

void mainNavigationPage() {
  if (blIsSignedIn) {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } else {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }
}
