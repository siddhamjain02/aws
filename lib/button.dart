

import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'login_final.dart';
import 'dart:ui' as ui;
import 'button.dart';
import 'dart:async';
import 'login.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
class Logfinal2 extends StatefulWidget {
  const Logfinal2({Key? key}) : super(key: key);

  @override
  _Logfinal2State createState() => _Logfinal2State();
}
TextEditingController emailController = TextEditingController();
TextEditingController confirmationCodeController = TextEditingController();
class _Logfinal2State extends State<Logfinal2> {
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
                      "Confirmation Code",
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
                        controller: confirmationCodeController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                        )),
                  ),
                ],
              ),
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
                    _confirmSignUp();
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
            )
          ],
        ),
      ),
    );
  }

    void _confirmSignUp() async {
      try {
        SignUpResult res = await Amplify.Auth.confirmSignUp(
            username: email,
            confirmationCode: confirmationCodeController.text
        );
        if (res.isSignUpComplete = true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Logfinal()));
        }
      } on AuthException catch (e) {
        print(e.message);
      }
    }
  }
