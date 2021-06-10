import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/dashBoardSettingsController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/fullScreenAlert/cityAlert.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/fullScreenAlert/divisonAlert.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'fullScreenAlert/areaAlert.dart';

class SettingBusinessDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var settingController = Get.put(DashBoardSettingController());

  @override
  Widget build(BuildContext context) {

    settingController.fetchThana(settingController.cityId.value, "");

    return Scaffold(
      appBar: buildBusinessInfoBar("Business Details"),
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentStart,
                children: [
                  textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  Obx(
                    () => AddBusinessForm(
                      //controller: c.businessNameController.value,
                      initialValue: settingController.businessNameController.value.text,
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
                    ),
                  ),
                  size10,
                  textUbuntu("Street Address", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  Obx(
                    () => AddBusinessForm(
                      //controller: c.businessNameController.value,
                      initialValue: settingController.streetAddressController.value.text,
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
                    ),
                  ),
                  size10,
                  textUbuntu("Land Mark", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  Obx(
                    () => AddBusinessForm(
                      //controller: c.businessNameController.value,
                      initialValue: settingController.landMarkController.value.text,
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
                    ),
                  ),
                  size10,
                  textUbuntu("Area", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      openAreaDialogSetting(context);
                    },
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textUbuntu(settingController.businessAreaName.value, kBlackColor.withOpacity(0.6), fontSize: 16)),
                          Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(onPressed: (){
                    settingController.updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID));
                  }, child: textUbuntu("Save", kPrimaryPurple)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
