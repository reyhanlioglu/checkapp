import 'package:checkapp/presentation/pages/hearing_test/hearing_test_screen.dart';
import 'package:checkapp/presentation/pages/home/home_screen.dart';
import 'package:checkapp/presentation/pages/vision_test/vision_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:checkapp/presentation/pages/welcome/welcome_screen.dart';
import 'package:checkapp/presentation/pages/login/login_screen.dart';
import 'package:checkapp/presentation/pages/login/registration_screen.dart';

void main() => runApp(CheckApp());

class CheckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        HearingTestScreen.id: (context) => HearingTestScreen(),
        VisionTestScreen.id: (context) => VisionTestScreen(),
      },
    );
  }
}
