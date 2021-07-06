import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/contactDetails/contactDetailsController.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SettingContactDetails extends StatefulWidget {
  @override
  _SettingContactDetailsState createState() => _SettingContactDetailsState();
}

class _SettingContactDetailsState extends State<SettingContactDetails> {
  var mobileNumbers = [];

  var c = Get.put(ContactDetailsSettingController());

  var numbers=TextEditingController();
  var map;

  @override
  void initState() {
    // TODO: implement initState
    print(boxNewStorage.read(BUSINESS_MOBILE_NUMBERS));

    c.addedMobileNumber.value = boxNewStorage.read(BUSINESS_MOBILE_NUMBERS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBusinessInfoBar("Contacts", actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
              onTap: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            //crossAxisAlignment: crossAxisAlignmentStart,
                            children: [
                              AddBusinessForm(
                                hintText: "add new number",
                                controller: numbers,
                                isSuffix: false,
                              ),
                              GestureDetector(
                                onTap: () {

                                  if(numbers.text.isEmpty){
                                    showToast("insert your number");
                                    return;
                                  }else if(numbers.text.length!=11){
                                    showToast("Mobile Number Format is not valid");
                                  }else{
                                    map = {"mobile_number": numbers.text};
                                    c.addMoreNumbers(map);
                                    //controller.mobileNumbers.add(MobileNumberModel(value:number.text));
                                    //json = jsonEncode(controller.mobileNumbers);
                                    numbers.clear();
                                  }

                                },
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Text(
                                      "ADD",
                                      style: textStyleUbuntu(color: kWhiteColor, fontWeight: weight500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.add)),
        )
      ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textUbuntu("Added Mobile Numbers", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: GridView.builder(
                    itemCount: c.addedMobileNumber.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 140, childAspectRatio: 8 / 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          c.addedMobileNumber.removeAt(index);
                        },
                        child: Row(
                          children: [
                            textUbuntu(c.addedMobileNumber[index]['mobile_number'], kPrimaryPurple,
                                fontWeight: weight500),
                            Icon(Icons.cancel)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
