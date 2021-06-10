import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/dashBoardSettingsController.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class ThanaDialog extends StatelessWidget {
  var controller = Get.put(DashBoardSettingController());

  var thanaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          elevation: 0.0,
          title: Text(
            "Select Thana",
            style: textStyleUbuntu(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive(
                  mobile: Container(
                      height: size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child: AddBusinessForm(
                              controller: thanaController,
                              hintText: "search by thana name",
                              isSuffix: false,
                              onChange: (value)async{
                                await controller.fetchThana(controller.cityId.value, value);
                              },
                            ),
                          ),
                          Obx(
                                () => controller.thanaModelClass.value == null
                                ? textUbuntu("loading...", kPrimaryPurple)
                                : controller.thanaModelClass.value.results.length == 0
                                ? textUbuntu("No data found", kPrimaryPurple)
                                : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.thanaModelClass.value.results.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.businessAreaName.value=controller.thanaModelClass.value.results[index].name;
                                      controller.areaId.value=controller.thanaModelClass.value.results[index].sId;
                                      Navigator.of(context).pop();
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: textUbuntu(
                                              controller.thanaModelClass.value.results[index].name,
                                              kPrimaryPurple,
                                              fontSize: 18,
                                              fontWeight: weight500),
                                        ),
                                        Divider(
                                          color: kPrimaryPurple,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                  tablet: Container(
                      height: size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child: AddBusinessForm(
                              controller: thanaController,
                              hintText: "search by thana name",
                              isSuffix: false,
                              onChange: (value)async{
                                await controller.fetchThana(controller.cityId.value, value);
                              },
                            ),
                          ),
                          Obx(
                                () => controller.thanaModelClass.value == null
                                ? spinKit
                                : controller.thanaModelClass.value.results.length == 0
                                ? textUbuntu("No data found", kPrimaryPurple)
                                : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.thanaModelClass.value.results.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.areaId.value=controller.thanaModelClass.value.results[index].sId;
                                      controller.businessAreaName.value=controller.thanaModelClass.value.results[index].name;
                                      Navigator.of(context).pop();
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: textUbuntu(
                                              controller.thanaModelClass.value.results[index].name,
                                              kPrimaryPurple,
                                              fontSize: 18,
                                              fontWeight: weight500),
                                        ),
                                        Divider(
                                          color: kPrimaryPurple,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void openAreaDialogSetting(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return ThanaDialog();
      },
      fullscreenDialog: true));
}
