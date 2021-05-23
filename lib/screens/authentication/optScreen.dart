import 'package:flutter/material.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/otpController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';
import '../../components/components.dart';
import '../../responsive.dart';

class OtpInputScreen extends StatelessWidget{

  var otpController = TextEditingController();

  var c=Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive(
                mobile: Stack(
                  children: [
                    Image.asset(
                      "assets/images/welcome.jpg",
                      height: size.height,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: kWhiteColor,
                            size: 18.0,
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: size.height / 1.2,
                        width: size.width,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Spacer(),
                            Image.asset(
                              "assets/images/johukuminfologo.png",
                              height: size.height / 2.5,
                            ),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Text(
                                        "Yoe are just few seconds away to enter the world of jo-hukum",
                                        style: textStyleUbuntu(
                                            color: kBlackColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        controller: otpController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "6 digit code",
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryPurple)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryPurple)),
                                          errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryPurple)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      WelcomeScreenButton(
                                          height: 40.0,
                                          edgeInsetsGeometry:
                                              EdgeInsets.symmetric(
                                                  horizontal: 90.0),
                                          buttonColor: kPrimaryPurple,
                                          buttonText: "Verify",
                                          textColor: kWhiteColor,
                                          fontSize: 16.0,
                                          isIcon: false,
                                          callback: () {

                                            if(otpController.text.isEmpty){
                                              showErrorToast("Insert OTP number");
                                              return;
                                            }else{
                                              print("${boxStorage.read(KEY_USER_PHONE)}");
                                              c.verifyOtpNumber(otpController.text, context);
                                            }
                                           // print("phone ${SharedConfig.pref.get("phone")}");
                                           // Navigator.pushNamed(context, '/userInfo');
                                          }),
                                      SizedBox(
                                        height: 70.0,
                                      ),
                                      Text(
                                        "Want to change mobile number?",
                                        style: textStyleUbuntu(
                                          color: kPrimaryPurple,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Get back",
                                        style: textStyleUbuntu(
                                            color: kBlackColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            textDecoration:
                                                TextDecoration.underline),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
