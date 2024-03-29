import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:johukum/components/components.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;


SystemUiOverlayStyle uiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  statusBarIconBrightness: Brightness.light,
  statusBarColor: kPrimaryPurple,
);

ThemeData theme = ThemeData(
  appBarTheme: appBarTheme,
  backgroundColor: white,
  iconTheme: iconThemeData,
  inputDecorationTheme: inputDecorationTheme,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: kPrimaryPurple,
  elevation: 0.0,
  textTheme: const TextTheme(
    headline6: const TextStyle(
      fontSize: 20,
    ),
  ),
);

IconThemeData iconThemeData = IconThemeData(color: kPrimaryPurple);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  gapPadding: 10,
);

const BoxDecoration tabDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(30)),
);

TextStyle tsSize(double x) => TextStyle(fontSize: x);

TextStyle tsBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold);

TextStyle tsColorBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold, color: kPrimaryPurple);
