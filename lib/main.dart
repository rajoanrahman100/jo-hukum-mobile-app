import 'package:flutter/material.dart';
import 'package:johukum/screens/authentication/loginScreen.dart';
import 'package:johukum/screens/authentication/optScreen.dart';
import 'package:johukum/screens/authentication/signUpScreen.dart';
import 'package:johukum/screens/authentication/userInformation.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'package:johukum/screens/notificationsScreen.dart';
import 'package:johukum/screens/profile/profileSetting.dart';
import 'components/config.dart';
import 'screens/home/homeScreen.dart';
import 'screens/welcomeScreen/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SharedConfig.pref = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // When navigating to the "/welcome" route, this is the welcome screen.
    return MaterialApp(debugShowCheckedModeBanner: false,initialRoute: '/welcome', routes: {
      '/welcome': (context) => WelcomeScreen(),
      '/signIn': (context) => SignInScreen(),
      '/signUp': (context) => SignUpScreen(),
      '/home': (context) => HomeScreen(),
      '/otpScreen': (context) => OtpInputScreen(),
      '/bottomNav': (context) => BottomNavScreen(),
      '/userInfo': (context) => UserAdditionalInformation(),
      '/profileSetting': (context) => ProfileSettings(),
      '/notification': (context) => NotificationScreen(),
    });
  }
}
