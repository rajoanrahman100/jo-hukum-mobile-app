import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/businessTypeController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/textWidgets.dart';

class BusinessTypeDialog extends StatelessWidget {
  var businessTypeController = Get.put(BusinessTypeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          elevation: 0.0,
          title: Text(
            "Select businessType",
            style: textStyleUbuntu(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive(
                  mobile: Obx(() => Container(
                        height: size.height,
                        child: businessTypeController.businessClass.value.results == null
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor: kPrimaryPurple,
                              ))
                            : businessTypeController.businessClass.value.results.length == 0
                                ? textUbuntu("No data found", kPrimaryPurple)
                                : ListView.builder(
                                    itemCount: businessTypeController.businessClass.value.results.length,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          businessTypeController.setBusinessIdName(
                                              businessTypeController.businessClass.value.results[index].name,
                                              businessTypeController.businessClass.value.results[index].sId);

                                          Navigator.of(context).pop();
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: textUbuntu(
                                                  businessTypeController.businessClass.value.results[index].name,
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
                      )),
                  tablet: Obx(() => Container(
                        height: size.height,
                        child: businessTypeController.businessClass.value.results == null
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor: kPrimaryPurple,
                              ))
                            : businessTypeController.businessClass.value.results.length == 0
                                ? textUbuntu("No data found", kPrimaryPurple)
                                : ListView.builder(
                                    itemCount: businessTypeController.businessClass.value.results.length,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          businessTypeController.setBusinessIdName(
                                              businessTypeController.businessClass.value.results[index].name,
                                              businessTypeController.businessClass.value.results[index].sId);
                                          Navigator.of(context).pop();
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: textUbuntu(
                                                  businessTypeController.businessClass.value.results[index].name,
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

void openBusinessTypeDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return BusinessTypeDialog();
      },
      fullscreenDialog: true));
}
