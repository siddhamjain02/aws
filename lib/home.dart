import 'login_final.dart';
import 'main.dart';
import 'button.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hey there",
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Hey! There",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              logout();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Logfinal()));
            },
            child: Text(
              'Submit..',
              style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 0),
                      const Offset(400, 0),
                      <Color>[
                        Colors.white,
                        Colors.white,
                      ],
                    )),
            ),
          ),
        ),
        drawer: Drawer(
          child: Center(child: Text('drawer')),
        ),
      ),
    );
  }
  void logout(){
    Amplify.Auth.signOut();
    issigned = false;
  }
}
