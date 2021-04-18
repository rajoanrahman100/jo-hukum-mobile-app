import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:johukum/components/config.dart';

// All of our constant stuff
const kPrimaryPurple = Color(0xFF482080);
const kSecondaryPurple = Color(0xFF76187E);
const kWhiteColor = Color(0xFFE5DFEC);
const kBlackColor = Color(0xFF000000);

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

const kDefaultPadding = 10.0;

InputDecoration buildInputDecoration(hintText, {Widget icons}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: icons,
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
    errorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
  );
}

