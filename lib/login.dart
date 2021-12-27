import 'package:flutter/material.dart';
import 'home.dart';
import 'login_final.dart';
import 'dart:ui' as ui;
import 'button.dart';
import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class Logfinal1 extends StatefulWidget {
  const Logfinal1({Key? key}) : super(key: key);

  @override
  _Logfinal1State createState() => _Logfinal1State();
}
bool _loggedIn = false;
bool _registered = false;

// String _email = 'jainsiddham420@gmail.com';
// String _password = 'Siddham@2002';
// String _confirmationNumber = "";
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _Logfinal1State extends State<Logfinal1> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
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
            "Sign Up",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.purple,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    alignment: Alignment.center,
                    child: Text(
                      "Email ID",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(30),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: TextField(
                        //
                        // onChanged: (v){
                        //   onChanged: v = _password;
                        // },
                      controller: emailController,
                        decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30))),
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(5),
                      //     topRight: Radius.circular(5))
                    ),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: TextField(
                      // onChanged: (v){
                      //   onChanged: v = _password;
                      // },
                      controller: passwordController,
                        decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30))),
                    )),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.purple,
                          ],
                        ),
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          _registerAccount();
                        },
                        child: Text(
                          'Submit..',
                          style: TextStyle(
                              fontSize: 40,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _registerAccount() async {
    SignUpResult res =await Amplify.Auth.signUp(
      username: emailController.text,
      password: passwordController.text,
      options: CognitoSignUpOptions(
        userAttributes: {"email": emailController.text},
      ),
    );
    if(res.isSignUpComplete= true) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Logfinal2()));}
}}
String email = emailController.text;