import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'homeScreen.dart';

//==================This is the Login Screen for the app==================
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => new _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: new Text(
              "Log In using Google",
              style: TextStyle(fontSize: 19),
            ),
            onPressed: () async {
              //LOGIN USING GOOGLE HERE
              FirebaseUser user = await authService.googleSignIn();
              if (user == null) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Failed to log in!"),
                      content: new Text(
                          "Please make sure your Google Account is usable. Also make sure that you have a active internet connection, and try again."),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                //Navigate to the Homescreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
