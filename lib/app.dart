import 'package:flutter/material.dart';
import 'package:senna_sims/screens/home.dart';
import 'package:senna_sims/theme/style.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
