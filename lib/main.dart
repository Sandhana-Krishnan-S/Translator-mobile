import 'package:flutter/material.dart';
import 'package:translator/Model/appTheme.dart';
import 'package:translator/View/splash.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      theme: ThemeData(
        primaryColor: Apptheme.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
