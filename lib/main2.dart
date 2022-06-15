import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/forgot_password_screen.dart';
import 'package:xtrip_mobile/screens/siginin_screen.dart';
import 'package:xtrip_mobile/screens/signup_screen.dart';
import 'package:xtrip_mobile/screens/splash_screen.dart';
import 'package:xtrip_mobile/screens/map_screen.dart';
import 'package:flutter_map/flutter_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomMap(),
    );
  }
}
