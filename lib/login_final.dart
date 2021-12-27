import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_blog/models/Blog.dart';
// import 'package:amplify_blog/models/ModelProvider.dart';
// import 'package:amplify_blog/post_screen.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'home.dart';
import 'login.dart';
bool issigned = false;

class Logfinal extends StatefulWidget {
  const Logfinal({Key? key}) : super(key: key);

  @override
  _LogfinalState createState() => _LogfinalState();
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
class _LogfinalState extends State<Logfinal> {
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
            "Hey! There",
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
                      "Login ID",
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
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.all(20),
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
                          _login();
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (_) => Home()));
                         },
                        child: Text(
                          'Submit...',
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
                  ),
                  Center(
                    child: Text(
                      "or..",
                      style: TextStyle(
                          fontSize: 30,
                          foreground: Paint()
                            ..shader = ui.Gradient.linear(
                              const Offset(0, 0),
                              const Offset(400, 0),
                              <Color>[
                                Colors.black,
                                Colors.black,
                              ],
                            )),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.all(20),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Logfinal1()));
                        },
                        child: Text(
                          'Sign Up',
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _login() async {
    SignInResult res = await Amplify.Auth.signIn(
      username: emailController.text,
      password: passwordController.text,
    );
    if (res.isSignedIn = true){
      issigned = res.isSignedIn;
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => Home()));
    }
    }
  }
