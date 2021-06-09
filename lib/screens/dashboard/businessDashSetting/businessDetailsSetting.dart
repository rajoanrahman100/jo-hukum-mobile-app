import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenDivision.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class SettingBusinessDetails extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();


  var c=Get.put(SingleBusinessAllDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBusinessInfoBar("Business Details"),
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentStart,
                children: [
                  textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.businessNameController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,
                  textUbuntu("Street Address", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.streetAddressController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,
                  textUbuntu("Land Mark", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.landMarkController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,
                  textUbuntu("Division", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.divisionController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,
                  textUbuntu("City", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.cityController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,
                  textUbuntu("Area", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(()=>AddBusinessForm(
                    //controller: c.businessNameController.value,
                    initialValue: c.areaController.value.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                  ),),
                  size10,

                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => textUbuntu(c.businessDivisionName.value, kBlackColor.withOpacity(0.6), fontSize: 16)),
                        GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              openDivisionDialog(context);
                            },
                            child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
