import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class CityDialog extends StatelessWidget {
  var divisionController = Get.put(DivisionController());

  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          elevation: 0.0,
          title: Text(
            "Select City",
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
                                controller: cityController,
                                hintText: "search by city name",
                                isSuffix: false,
                                onChange: (value)async{
                                  await divisionController.fetchCity(divisionController.selectDivisionId.value,value);
                                },
                              ),
                            ),
                            Obx(
                              () => divisionController.cityModelClass.value == null
                                  ? textUbuntu("loading...", kPrimaryPurple)
                                  : divisionController.cityModelClass.value.results.length == 0
                                      ? textUbuntu("No data found", kPrimaryPurple)
                                      : Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: divisionController.cityModelClass.value.results.length,
                                            itemBuilder: (_, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  divisionController.setCity(
                                                      divisionController.cityModelClass.value.results[index].name);
                                                  divisionController.setCityID(
                                                      divisionController.cityModelClass.value.results[index].sId);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                                      child: textUbuntu(
                                                          divisionController.cityModelClass.value.results[index].name,
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
                              controller: cityController,
                              hintText: "search by city name",
                              isSuffix: false,
                              onChange: (value)async{
                                await divisionController.fetchCity(divisionController.selectDivisionId.value,value);
                              },
                            ),
                          ),
                          Obx(
                                () => divisionController.cityModelClass.value == null
                                ? textUbuntu("loading...", kPrimaryPurple)
                                : divisionController.cityModelClass.value.results.length == 0
                                ? textUbuntu("No data found", kPrimaryPurple)
                                : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: divisionController.cityModelClass.value.results.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      divisionController.setCity(
                                          divisionController.cityModelClass.value.results[index].name);
                                      divisionController.setCityID(
                                          divisionController.cityModelClass.value.results[index].sId);
                                      Navigator.of(context).pop();
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: textUbuntu(
                                              divisionController.cityModelClass.value.results[index].name,
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

void openCityDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return CityDialog();
      },
      fullscreenDialog: true));
}
