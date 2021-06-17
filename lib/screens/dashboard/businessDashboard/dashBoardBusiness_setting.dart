import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/controller/dashBoardController/dashBoardSettingsController.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/textWidgets.dart';

class SettingDashBoardBusiness extends StatefulWidget {
  @override
  _SettingDashBoardBusinessState createState() => _SettingDashBoardBusinessState();
}

class _SettingDashBoardBusinessState extends State<SettingDashBoardBusiness> {
  var c = Get.put(SingleBusinessAllDataController());

  var settingController = Get.put(DashBoardSettingController());

  @override
  void initState() {
    // TODO: implement initState
    //settingController.getMyBusinessData(boxStorage.read(MY_BUSINESS_SLUG));
    print("_________BusinessName__________" + boxNewStorage.read(Business_NAME));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(body: Responsive(
      mobile: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  textUbuntu("Setting", kPrimaryPurple),
                  Expanded(
                      child: Divider(
                    color: kPrimaryPurple,
                    height: 2,
                  ))
                ],
              ),
              size20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/businessSettingLand');
                          },
                          child: Container(
                            height: size.height / 5,
                            decoration: containerBoxDecoration(color: Colors.white, borderRadius: 10.0, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kPrimaryPurple),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80.0),
                                  child: CachedNetworkImage(
                                    imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${c.singleBusinessValue.value.logo}",
                                    height: 140,
                                    width: 140,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => spinKit,
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: kPrimaryPurple,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        size10,
                        textUbuntu("Business Profile", kBlackColor, fontSize: 18.0, fontWeight: weight500)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      tablet: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  textUbuntu("Setting", kPrimaryPurple),
                  Expanded(
                      child: Divider(
                    color: kPrimaryPurple,
                    height: 2,
                  ))
                ],
              ),
              size20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: size.height / 4,
                          decoration: containerBoxDecoration(color: Colors.white, borderRadius: 10.0, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kPrimaryPurple),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: CachedNetworkImage(
                                  imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${c.singleBusinessValue.value.logo}",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => spinKit,
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: kPrimaryPurple,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        size10,
                        textUbuntu("Business Profile", kBlackColor, fontSize: 18.0, fontWeight: weight500)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
