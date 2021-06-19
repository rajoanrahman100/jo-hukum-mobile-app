import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:johukum/components/theme.dart';
import 'package:johukum/screens/addBusiness/lastSuccessScreen.dart';
import 'package:johukum/screens/addBusiness/stepFiveScreen.dart';
import 'package:johukum/screens/addBusiness/stepFourScreen.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/addBusiness/stepSevenScreen.dart';
import 'package:johukum/screens/addBusiness/stepSixScreen.dart';
import 'package:johukum/screens/addBusiness/stepThreeScreen2.dart';
import 'package:johukum/screens/addBusiness/stepTwoScreen.dart';
import 'package:johukum/screens/authentication/forgotPassword/forgotPassOtpEntry.dart';
import 'package:johukum/screens/authentication/forgotPassword/setNewPassword.dart';
import 'package:johukum/screens/authentication/loginScreen.dart';
import 'package:johukum/screens/authentication/optScreen.dart';
import 'package:johukum/screens/authentication/signUpScreen.dart';
import 'package:johukum/screens/authentication/userInformation.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/settingLandingScrren.dart';
import 'package:johukum/screens/home/seeAllCategories.dart';
import 'package:johukum/screens/home/userProfileSetting.dart';
import 'package:johukum/screens/notificationsScreen.dart';
import 'package:johukum/screens/profile/profileSetting.dart';
import 'package:johukum/screens/subCategory/subCategories.dart';
import 'package:johukum/screens/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/config.dart';
import 'screens/authentication/forgotPassword/forgotPassPhoneNumberEntry.dart';
import 'screens/dashboard/businessDashSetting/businessDetailsSetting.dart';
import 'screens/dashboard/businessDashboard/dashboardBar.dart';
import 'screens/elasticSearch/businessProfile.dart';
import 'screens/home/homeScreen.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  SharedConfig.pref = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);

  runApp(GetMaterialApp(
    home: MyApp(),
    theme: theme,
    debugShowCheckedModeBanner: false,
  ));

 /*runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => GetMaterialApp(
            home: MyApp(),
            debugShowCheckedModeBanner: false,
          )));*/
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //When navigating to the "/welcome" route, this is the welcome screen.
    return MaterialApp(
        //locale: DevicePreview.locale(context),
        // Add the locale here
        //builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => WrapperClass(),
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
          '/lastSuccess': (context) => LastSuccessScreen(),
          '/dashBoard': (context) => DashBoardBusinessTabs(),
          '/businessSettingLand': (context) => BusinessSettingLanding(),
          '/settingBussinessDetails': (context) => SettingBusinessDetails(),
          '/seeAllCategories': (context) => Categories(),
          '/userSetting': (context) => UserProfileSetting(),
          '/forgotPassNumberEntry': (context) => ForgotPassNumberEntry(),
          '/forgotPassOtpEntry': (context) => ForgotPassOtpEntry(),
          '/newPassEntry': (context) => NewPasswordScreen(),
        });
  }
}
