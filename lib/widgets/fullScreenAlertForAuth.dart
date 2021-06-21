import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dialogAuthController.dart';
import 'package:johukum/controller/elasticController.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/controller/passController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/searchResultWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AuthenticationDialog extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  var c = Get.put(PassWordController());
  var numberController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        body: Responsive(
          mobile: Container(
            height: size.height,
            //color: Colors.red,
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
                        onTap:(){
                          print("TAPPED");
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: 50.0,width: 50.0,
                          child: Icon(
                            Icons.cancel_sharp,
                            color: kWhiteColor,
                            size: 30.0,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: size.height / 1,
                    width: size.width,
                    //color: Colors.red,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/johukuminfologo.png",
                              height: size.height / 3.0,
                            ),
                            Container(
                              width: size.width,
                              decoration:
                              BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child:Column(
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
                                          errorBorder:
                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                          border:
                                          UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                        ),
                                      ),
                                      GetBuilder<PassWordController>(builder: (controller){
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
                                                FocusScope.of(context)
                                                    .unfocus(); //hide keyboard
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
                                        child: Text(
                                          "Forgot Password?",
                                          style: textStyleUbuntu(
                                              color: kPrimaryPurple,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              textDecoration: TextDecoration.underline),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),

                                      GetBuilder<DialogAuthController>(
                                        builder: (dialogController){
                                          return  WelcomeScreenButton(
                                            height: 40.0,
                                            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                            buttonColor: kPrimaryPurple,
                                            buttonText: "Tap to in",
                                            textColor: kWhiteColor,
                                            fontSize: 16.0,
                                            isIcon: false,
                                            callback: () {
                                              if (_formKey.currentState.validate()) {
                                                dialogController.getSignInUser(numberController.text,
                                                    passWordController.text, context);

                                                //getSignInUser(numberController.text, passWordController.text,
                                                // context);
                                              }
                                            },
                                          );
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
                                          Image.asset("assets/images/google.png"),
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
                                      Text(
                                        "Sign Up",
                                        style: textStyleUbuntu(
                                            color: kBlackColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            textDecoration: TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
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
            height: double.infinity,
            //width: size.width,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/welcome.jpg",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:()=>Navigator.pop(context),
                        child: Icon(
                          Icons.cancel_sharp,
                          color: kWhiteColor,
                          size: 40.0,
                        ),
                      )
                    ],
                  ),
                ),

                Center(
                  child: Container(
                    height: size.height / 1,
                    width: size.width,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/johukuminfologo.png",
                              height: size.height / 2.5,
                            ),
                            Container(
                              width: size.width,
                              decoration:
                              BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
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
                                          errorBorder:
                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                          border:
                                          UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                        ),
                                      ),
                                      size20,
                                      GetBuilder<PassWordController>(builder: (controller){
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
                                                FocusScope.of(context)
                                                    .unfocus(); //hide keyboard
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
                                      size10,
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Forgot Password?",
                                          style: textStyleUbuntu(
                                              color: kPrimaryPurple,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              textDecoration: TextDecoration.underline),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),

                                      GetBuilder<DialogAuthController>(
                                        builder: (dialogController){
                                          return  WelcomeScreenButton(
                                            height: 55.0,
                                            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                            buttonColor: kPrimaryPurple,
                                            buttonText: "Tap to in",
                                            textColor: kWhiteColor,
                                            fontSize: 16.0,
                                            isIcon: false,
                                            callback: () {
                                              if (_formKey.currentState.validate()) {
                                                dialogController.getSignInUser(numberController.text,
                                                    passWordController.text, context);
                                                //getSignInUser(numberController.text, passWordController.text,
                                                // context);
                                              }
                                            },
                                          );
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
                                          Image.asset("assets/images/google.png"),
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
                                      Text(
                                        "Sign Up",
                                        style: textStyleUbuntu(
                                            color: kBlackColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            textDecoration: TextDecoration.underline),
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
        ),
      ),
    );
  }
}

void openAddAuthDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return  AuthenticationDialog();
      },
      fullscreenDialog: true));
}
