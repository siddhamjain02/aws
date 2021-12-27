import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:aws/login_final.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'home.dart';
void main(List<String> args) {
  runApp(App1());
}

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  _App1State createState() => _App1State();
}


class _App1State extends State<App1> {
  @override
  bool _amplifyConfigured = false;
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
    setState(() {
      _amplifyConfigured = true;
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: issigned ?  Home() : Logfinal(),
    ));
  }
}
