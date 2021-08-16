import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';

class AddBusinessForm extends StatelessWidget {
  double height;
  String hintText;
  int maxLine;
  TextEditingController controller;
  String initialValue;
  Function validator;
  Function onChange;
  Function onSave;
  Widget suffixIcon;
  bool isSuffix;
  Widget prefix;
  TextInputType textInputType;

  AddBusinessForm({this.height,
    this.hintText,
    this.maxLine,
    this.controller,
    this.initialValue,
    this.validator,
    this.onChange,
    this.onSave,
    this.suffixIcon,
    this.isSuffix,
    this.prefix,
    this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        initialValue: initialValue,
        keyboardType: textInputType,
        maxLines: maxLine ?? 1,
        validator: validator,
        onChanged: onChange,
        onSaved: onSave,
        decoration: InputDecoration(
            filled: true,
            fillColor: kPrimaryPurple.withOpacity(0.2),
            hintText: hintText,
            contentPadding: isSuffix == false
                ? EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0)
                : EdgeInsets.only(left: 14.0, top: 15.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            prefix:prefix,
            suffixIcon: suffixIcon ?? null),
      ),
    );
  }
}
