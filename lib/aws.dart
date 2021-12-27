import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:aws/login_final.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  try {
  await Amplify.configure(amplifyconfig);
} catch (e) {
  print(e);
  print("Tried to reconfigure Amplify");
}
  // AmplifyDataStore dataStorePlugin =
  // AmplifyDataStore(modelProvider: ModelProvider.instance);
  AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
  Amplify.addPlugin(authPlugin);


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Logfinal(),
    );
  }
}