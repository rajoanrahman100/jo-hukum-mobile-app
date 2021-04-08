import 'package:flutter/material.dart';
import 'package:johukum/screens/authentication/loginScreen.dart';
import 'package:johukum/screens/authentication/optScreen.dart';
import 'package:johukum/screens/authentication/signUpScreen.dart';
import 'package:johukum/screens/authentication/userInformation.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'file:///C:/Users/Rifat/AndroidStudioProjects/johukum/lib/screens/home/homeScreen.dart';
import 'screens/welcomeScreen/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // When navigating to the "/welcome" route, this is the welcome screen.
    return MaterialApp(debugShowCheckedModeBanner: false,initialRoute: '/userInfo', routes: {
      '/welcome': (context) => WelcomeScreen(),
      '/signIn': (context) => SignInScreen(),
      '/signUp': (context) => SignUpScreen(),
      '/home': (context) => HomeScreen(),
      '/otpScreen': (context) => OtpInputScreen(),
      '/bottomNav': (context) => BottomNavScreen(),
      '/userInfo': (context) => UserAdditionalInformation(),
    });
  }
}
