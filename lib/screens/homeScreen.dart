import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_web_firebase/main.dart';
import 'package:mobile_web_firebase/services/auth.dart';
//==================This is the Homepage for the app==================

String strAppBarTitle = "Healthstation Foundation";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  //Loads user data
  Future<void> loadUserData() async {
    //Get the data from firestore
    await authService.getData();
    //Not setState, to reflect the changes of Map to the widget tree
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        home: Scaffold(
          appBar: AppBar(
            title: Text((!kIsWeb) ? "Welcome, " + firebaseUser.displayName : "Welcome"),
          ),

          //FAB
          floatingActionButton: FloatingActionButton.extended(
              label: Text("Add data"),
              onPressed: () {
                //Add data to the map
                userProfile[userProfile.length.toString()] = DateTime.now().toString();

                //update the Firestore database
                authService.setData().then((success) {
                  //If not successfully uploaded, remove the previous change
                  if (!success) userProfile.remove(userProfile.length - 1);
                });

                //rebuild the widget tree
                setState(() {});
              }),

          //Body
          body: //Home
              Column(
            children: <Widget>[
              Container(
                height: 50,
                child: RaisedButton(
                  child: new Text(
                    "Clear",
                    style: TextStyle(fontSize: 19),
                  ),
                  onPressed: () {
                    setState(() {
                      userProfile.clear();
                    });
                    //update the database
                    authService.setData();
                  },
                ),
              ),
              userProfile == null
                  ? Center(child: Text("No Data"))
                  : Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: ListView.builder(
                          itemCount: userProfile.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(userProfile.keys.elementAt(index)),
                                subtitle: Text(userProfile.values.elementAt(index)));
                          }),
                    ),
            ],
          ),
        ));
  }
}
