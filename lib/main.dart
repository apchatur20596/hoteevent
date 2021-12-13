import 'package:flutter/material.dart';
import 'package:hoteevent/Failure.dart';
import 'package:hoteevent/Home.dart';
import 'package:hoteevent/Success.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/success': (context) => Success(),
      '/failure': (context) => Failure(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
