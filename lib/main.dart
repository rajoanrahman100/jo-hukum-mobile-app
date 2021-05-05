import 'package:flutter/material.dart';
import 'package:johukum/screens/addBusiness/stepFiveScreen.dart';
import 'package:johukum/screens/addBusiness/stepFourScreen.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/addBusiness/stepSevenScreen.dart';
import 'package:johukum/screens/addBusiness/stepSixScreen.dart';
import 'package:johukum/screens/addBusiness/stepThreeScreen2.dart';
import 'package:johukum/screens/addBusiness/stepTwoScreen.dart';
import 'package:johukum/screens/authentication/loginScreen.dart';
import 'package:johukum/screens/authentication/optScreen.dart';
import 'package:johukum/screens/authentication/signUpScreen.dart';
import 'package:johukum/screens/authentication/userInformation.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'file:///D:/Flutter%20Apss/jo-hukum-mobile-app/lib/screens/elasticSearch/businessProfile.dart';
import 'package:johukum/screens/notificationsScreen.dart';
import 'package:johukum/screens/profile/profileSetting.dart';
import 'package:johukum/screens/subCategory/subCategories.dart';
import 'components/config.dart';
import 'screens/home/homeScreen.dart';
import 'screens/welcomeScreen/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

void main() async{

  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  SharedConfig.pref = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //When navigating to the "/welcome" route, this is the welcome screen.
    return MaterialApp(debugShowCheckedModeBanner: false,initialRoute: '/stepThree', routes: {
      '/welcome': (context) => WelcomeScreen(),
      '/signIn': (context) => SignInScreen(),
      '/signUp': (context) => SignUpScreen(),
      '/home': (context) => HomeScreen(),
      '/otpScreen': (context) => OtpInputScreen(),
      '/bottomNav': (context) => BottomNavScreen(),
      '/userInfo': (context) => UserAdditionalInformation(),
      '/profileSetting': (context) => ProfileSettings(),
      '/notification': (context) => NotificationScreen(),
      '/subCategories': (context) => SubCategories(),
      '/businessProfile': (context) => BusinessProfile(),
      '/stepOne': (context) => StepOneScreen(),
      '/stepTwo': (context) => StepTwoScreen(),
      '/stepThree': (context) => StepTheeScreenTwo(),
      '/stepFour': (context) => StepFourScreen(),
      '/stepFive': (context) => StepFiveScreen(),
      '/stepSix': (context) => StepSixScreen(),
      '/stepSeven': (context) => StepSevenScreen(),
    });
  }
}
