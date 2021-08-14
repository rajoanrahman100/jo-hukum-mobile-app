import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/controller/authController.dart';
import 'package:johukum/controller/passController.dart';
import 'package:johukum/screens/authentication/signUpScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../components/components.dart';
import '../../responsive.dart';

class SignInScreen extends StatelessWidget {
  var numberController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmPassWordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var logInController = Get.put(AuthController());
  var c = Get.put(PassWordController());

  GoogleSignIn googleSignIn = GoogleSignIn(
    //clientId: "23550904515-sek3no2rtksg62dr314ocqobgvgsjo60.apps.googleusercontent.com",
    scopes: [
      //"23550904515-sek3no2rtksg62dr314ocqobgvgsjo60.apps.googleusercontent.com"
      'email', // you can add extras if you require
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn().then((value){
        print("display name:"+value.displayName);
        print("display email:"+value.email);
        print("ID:"+value.id);
        print("photo url:"+value.photoUrl);

        value.authentication.then((value){
          log("ID token:"+value.idToken);
          //socialLogin(value.idToken);
        });
      });
    } catch (error) {
      print(error);
    }
  }


  Future socialLogin(token) async {

    //JohukumLoaderAnimation.showLoaderAnimation(context: context);

    var res = await http.post(Uri.parse("https://api-login.jo-hukum.com/api/auth/social-login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"token": token,"platform":"google"}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      //JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      //Navigator.pushNamed(context,'/userInfo');
      //showSuccessToast("a 6 digit code sent to your number");
      return;
    } else {
      print("error response " + res.body);
      //showErrorToast("You have given a invalid OTP number");
      //JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Responsive(
          mobile: Container(
            height: size.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/welcome.jpg",
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                          size: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: size.height / 1.2,
                    width: size.width,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/newjohukum.png",
                              height: size.height / 4.0,
                            ),
                            size20,
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "SIGN IN",
                                        style: textStyleUbuntu(
                                            color: kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        controller: numberController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Enter your phone number";
                                          }
                                          if (value.length > 11 || value.length < 11) {
                                            return "Number format is invalid";
                                          }
                                          _formKey.currentState.save();
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                          focusedBorder:
                                              UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                          enabledBorder:
                                              UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                        ),
                                      ),
                                      GetBuilder<PassWordController>(builder: (controller) {
                                        return TextFormField(
                                          controller: passWordController,
                                          keyboardType: TextInputType.text,
                                          obscureText: !controller.showLonInPass.value,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Enter your password";
                                            }
                                            _formKey.currentState.save();
                                            return null;
                                          },
                                          decoration: buildInputDecoration(
                                            "Enter password",
                                            icons: GestureDetector(
                                              onTap: () {
                                                controller.showLogInPassWord();
                                                FocusScope.of(context).unfocus(); //hide keyboard
                                              },
                                              child: Icon(
                                                controller.showLonInPass.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/forgotPassNumberEntry');
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: textStyleUbuntu(
                                                color: kPrimaryPurple,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                textDecoration: TextDecoration.underline),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      WelcomeScreenButton(
                                        height: 40.0,
                                        edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                        buttonColor: kPrimaryPurple,
                                        buttonText: "Tap to in",
                                        textColor: kWhiteColor,
                                        fontSize: 16.0,
                                        isIcon: false,
                                        callback: () {
                                          if (_formKey.currentState.validate()) {
                                            logInController.getSignInUser(
                                                numberController.text, passWordController.text, context);

                                            //getSignInUser(numberController.text, passWordController.text,
                                            // context);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Or use your account",
                                        style: textStyleUbuntu(
                                            color: kPrimaryPurple,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            textDecoration: TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/images/fb.png"),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          GestureDetector(
                                              onTap: () async {
                                                _handleSignIn();
                                                //await googleSignIn.signIn().then((value) => print(value.id));
                                              },
                                              child: Image.asset("assets/images/google"
                                                  ".png")),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Image.asset("assets/images/apple.png"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Don't have an account?",
                                        style: textStyleUbuntu(
                                          color: kPrimaryPurple,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.to(SignUpScreen()),
                                        child: Text(
                                          "Sign Up",
                                          style: textStyleUbuntu(
                                              color: kBlackColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              textDecoration: TextDecoration.underline),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          tablet: Container(
            height: size.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/welcome.jpg",
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: size.height / 1.2,
                    width: size.width,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/newjohukum.png",
                              height: size.height / 3.5,
                            ),
                            size20,
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Text(
                                        "SIGN IN",
                                        style: textStyleUbuntu(
                                            color: kBlackColor, fontSize: 20.0, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        controller: numberController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Enter your phone number";
                                          }
                                          if (value.length > 11 || value.length < 11) {
                                            return "Number format is invalid";
                                          }
                                          _formKey.currentState.save();
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                          focusedBorder:
                                              UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                          enabledBorder:
                                              UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                        ),
                                      ),
                                      size20,
                                      GetBuilder<PassWordController>(builder: (controller) {
                                        return TextFormField(
                                          controller: passWordController,
                                          keyboardType: TextInputType.text,
                                          obscureText: !controller.showLonInPass.value,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Enter your password";
                                            }
                                            _formKey.currentState.save();
                                            return null;
                                          },
                                          decoration: buildInputDecoration(
                                            "Enter password",
                                            icons: GestureDetector(
                                              onTap: () {
                                                controller.showLogInPassWord();
                                                FocusScope.of(context).unfocus(); //hide keyboard
                                              },
                                              child: Icon(
                                                controller.showLonInPass.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/forgotPassNumberEntry');
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: textStyleUbuntu(
                                                color: kPrimaryPurple,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                textDecoration: TextDecoration.underline),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      WelcomeScreenButton(
                                        height: 55.0,
                                        edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                        buttonColor: kPrimaryPurple,
                                        buttonText: "Tap to in",
                                        textColor: kWhiteColor,
                                        fontSize: 16.0,
                                        isIcon: false,
                                        callback: () {
                                          if (_formKey.currentState.validate()) {
                                            logInController.getSignInUser(
                                                numberController.text, passWordController.text, context);

                                            //getSignInUser(numberController.text, passWordController.text,
                                            // context);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Or use your account",
                                        style: textStyleUbuntu(
                                            color: kPrimaryPurple,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            textDecoration: TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/images/fb.png"),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          GestureDetector(
                                              onTap: () async {
                                                //await googleSignIn.signIn().then((value) => print(value.displayName));
                                              },
                                              child: Image.asset("assets/images/google"
                                                  ".png")),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Image.asset("assets/images/apple.png"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Don't have an account?",
                                        style: textStyleUbuntu(
                                          color: kPrimaryPurple,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.to(SignUpScreen()),
                                        child: Text(
                                          "Sign Up",
                                          style: textStyleUbuntu(
                                              color: kBlackColor,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              textDecoration: TextDecoration.underline),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
