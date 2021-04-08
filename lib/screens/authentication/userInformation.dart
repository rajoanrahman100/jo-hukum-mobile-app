import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';

class UserAdditionalInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Responsive(mobile: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/welcome.jpg")),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Icon(Icons.arrow_back_ios,color: kWhiteColor,size: 20,),
                  ),
                ),
                Image.asset(
                  "assets/images/johukuminfologo.png",
                  height: 300,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
