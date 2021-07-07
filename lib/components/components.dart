import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// All of our constant stuff
const kPrimaryPurple = Color(0xFF482080);
const kSecondaryPurple = Color(0xFF76187E);
const kWhiteColor = Color(0xFFE5DFEC);
const kBlackColor = Color(0xFF000000);

const kPinkColor = Color(0xFFDF0487);
const kBlueColor = Color(0xFF2E5BFF);
const kAquaGreenColor = Color(0xFF00C6D5);
const kYellowColor = Color(0xFFFFC400);

const weight500 = FontWeight.w500;
const weightBold = FontWeight.bold;
const weight400 = FontWeight.w400;

const size20 = SizedBox(
  height: 20,
);
const size10 = SizedBox(
  height: 10,
);
const size15 = SizedBox(
  height: 15,
);
const size5 = SizedBox(
  height: 5,
);

const width5 = SizedBox(
  width: 5,
);

const width10 = SizedBox(
  width: 10,
);

const kDefaultPadding = 10.0;

InputDecoration buildInputDecoration(hintText, {Widget icons}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: icons,
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
  );
}

///Spinkit loader
const spinKit = SpinKitFadingCircle(
  color: kPrimaryPurple,
  size: 30.0,
);

CrossAxisAlignment crossAxisAlignmentCenter = CrossAxisAlignment.center;
CrossAxisAlignment crossAxisAlignmentStart = CrossAxisAlignment.start;

MainAxisAlignment mainAxisAlignmentCenter = MainAxisAlignment.center;
MainAxisAlignment mainAxisAlignmentBetween = MainAxisAlignment.spaceBetween;

String intro="Jo-Hukum is the most advanced local business search engine. The technology company operates the largest"
    " business search platform in Bangladesh connecting local businesses and customers. Its most powerful search engine provides local, authentic, and relevant Business information to help consumers discover nearby goods and services.";

String whyOne="As a local search engine, Jo-Hukum allows you to quickly find a business based on your location. You "
    "can search for local information on products, services, and various things.";

String whyTwo="Jo-Hukum has been designed from the ground up to serve authentic local business information and make "
    "your search fast and easy.";

String how="With the most powerful search engine of Jo-Hukum, You can search for the type of business you are looking"
    " for and Jo-Hukum will show you the businesses that match your search. Whether you need the phone number, address, map location, website, hours of operation, or reviews, Jo-Hukum is here to help.";