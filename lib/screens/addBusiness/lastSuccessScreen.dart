import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';

class LastSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Success Message"),
      //backgroundColor: Colors.grey[300],
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/enlist.png", height: size.height * 0.3),
            Container(
              height: size.height * 0.2,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                //color: kWhiteColor
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Thanks for enlisting your business.Our jo-hukum team will review your listing "
                    "within 24 hour and it will be published soon.",
                    style: textStyleUbuntu(color: Colors.grey, fontWeight: weight500, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            size20,
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/bottomNav');

              },
                child: textUbuntu("Go To Home Page", kPrimaryPurple, fontWeight: weightBold, fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
