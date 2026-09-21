import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nouman_knop/firebase_options.dart';
import 'package:nouman_knop/routes.dart' as routes;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
