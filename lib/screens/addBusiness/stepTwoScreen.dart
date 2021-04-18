import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../responsive.dart';

class StepTwoScreen extends StatefulWidget {

  @override
  _StepTwoScreenState createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {

  final _formKey = GlobalKey<FormState>();

  List<Widget> children = [];
  int count = 1;

  void add() {
    children = List.from(children)
      ..add(AddBusinessForm(
        textInputType: TextInputType.number,
        hintText: "mobile number $count",
        isSuffix: false,
      ),);
    setState(() => ++count);
  }

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar:buildBusinessInfoBar("Step 2/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    size10,
                    textUbuntu("Title*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "Mr/Mrs",
                      suffixIcon: Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,),
                      isSuffix: true,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),

                    size10,
                    textUbuntu("Full Name*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "full name",
                      isSuffix: false,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),

                    size10,
                    textUbuntu("Desintion*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "designation",
                      isSuffix: false,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),

                    size10,
                    textUbuntu("Phone Number", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.number,
                      hintText: "phone number",
                      isSuffix: false,
                    ),

                    size10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textUbuntu("Mobile Number 1*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
//                        GestureDetector(
//                          onTap: ()=>add(),
//                          child: Container(
//                            height: 30,
//                            width: 130,
//                            decoration: BoxDecoration(
//                              color: kPrimaryPurple,
//                              borderRadius: BorderRadius.circular(10.0)
//                            ),
//                            child: Center(
//                              child: textUbuntu("Add phone number", kWhiteColor),
//                            ),
//                          ),
//                        )
                      ],
                    ),
                    AddBusinessForm(
                      textInputType: TextInputType.number,
                      hintText: "phone number 1",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Mobile Number 2(optional)", kBlackColor.withOpacity(0.3),fontSize: 16.0,fontWeight: weight400),
                    AddBusinessForm(
                      textInputType: TextInputType.number,
                      hintText: "phone number 2",
                      isSuffix: false,
                    ),

                    size10,
                    textUbuntu("Mobile Number 3(optional)", kBlackColor.withOpacity(0.3),fontSize: 16.0,fontWeight: weight400),
                    AddBusinessForm(
                      textInputType: TextInputType.number,
                      hintText: "phone number 3",
                      isSuffix: false,
                    ),

                    size10,
                    textUbuntu("Email", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "phone number 3",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Fax", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "fax",
                      isSuffix: false,
                    ),

                    size10,
                    textUbuntu("Website", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "fax",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Facebook", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "facebook link",
                      isSuffix: false,
                    ),size10,
                    textUbuntu("Instagram", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "instagram link",
                      isSuffix: false,
                    ),size10,
                    textUbuntu("Twitter", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      textInputType: TextInputType.emailAddress,
                      hintText: "twitter link",
                      isSuffix: false,
                    ),
                    size10,

                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, '/stepThree'),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          textUbuntu("Go To Step 3 ", kPrimaryPurple,fontWeight: weightBold,fontSize: 18.0),
                          Icon(Icons.arrow_forward,color: kPrimaryPurple,)
                        ],
                      ),
                    ),

                    size20
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
