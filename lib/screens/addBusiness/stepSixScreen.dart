import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/imageController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepSixScreen extends StatelessWidget {

  var imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 6/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUbuntu("Business Logo", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  Container(
                    height: size.height * 0.2,
                    child: new Column(
                      children: <Widget>[
                        Obx(() => Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(fit: StackFit.loose, children: <Widget>[
                                new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    imageController.selectLogoImagePath.value == ""
                                        ? Container(
                                            width: 130.0,
                                            height: 130.0,
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.black),
                                              image: new DecorationImage(
                                                image: new ExactAssetImage('assets/images/johukuminfologo.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ))
                                        : Container(
                                            width: 130.0,
                                            height: 130.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: FileImage(File(imageController.selectLogoImagePath.value)),
                                                    fit: BoxFit.cover)),
                                          ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new CircleAvatar(
                                          backgroundColor: kPrimaryPurple,
                                          radius: 25.0,
                                          child: new IconButton(
                                              onPressed: () {
                                                buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                                  imageController.getLogoImage(ImageSource.camera, context);
                                                  Navigator.of(context).pop();
                                                }, galleryCallBack: () {
                                                  imageController.getLogoImage(ImageSource.gallery, context);
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              icon: Icon(
                                                Icons.camera_alt,
                                                color: kWhiteColor,
                                                size: 20,
                                              )),
                                        )
                                      ],
                                    )),
                              ]),
                            )),
                      ],
                    ),
                  ),
                  textUbuntu("Business Cover Photo", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size20,
                  Obx(
                    () => imageController.selectCoverImagePath.value == ""
                        ? GestureDetector(
                            onTap: () {
                              buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                imageController.getCoverImage(ImageSource.camera, context);
                                Navigator.of(context).pop();
                              }, galleryCallBack: () {
                                imageController.getCoverImage(ImageSource.gallery, context);
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                                height: 200.0,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 80.0,
                                  color: Colors.blueGrey[900],
                                )),
                          )
                        : Container(
                            height: 200.0,
                            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: FileImage(File(imageController.selectCoverImagePath.value)),
                                    fit: BoxFit.cover)),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            buildShowBarModalBottomSheet(context, cameraCallBack: () {
                              imageController.getCoverImage(ImageSource.camera, context);
                              Navigator.of(context).pop();
                            }, galleryCallBack: () {
                              imageController.getCoverImage(ImageSource.gallery, context);
                              Navigator.of(context).pop();
                            });
                          },
                          child: textUbuntu("Upload Cover Photo", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500)),
                    ],
                  ),
                  size20,
                  textUbuntu("Add More Photos", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                          () => imageController.selectCoverImagePath.value == ""
                              ? GestureDetector(
                                  onTap: () {
                                    buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                      imageController.getCoverImage(ImageSource.camera, context);
                                      Navigator.of(context).pop();
                                    }, galleryCallBack: () {
                                      imageController.getCoverImage(ImageSource.gallery, context);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: NewWidget(),
                                )
                              : Container(
                                  height: 120.0,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: FileImage(File(imageController.selectCoverImagePath.value)),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => imageController.selectCoverImagePath.value == ""
                              ? GestureDetector(
                                  onTap: () {
                                    buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                      imageController.getCoverImage(ImageSource.camera, context);
                                      Navigator.of(context).pop();
                                    }, galleryCallBack: () {
                                      imageController.getCoverImage(ImageSource.gallery, context);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: NewWidget(),
                                )
                              : Container(
                                  height: 120.0,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: FileImage(File(imageController.selectCoverImagePath.value)),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => imageController.selectCoverImagePath.value == ""
                              ? GestureDetector(
                                  onTap: () {
                                    buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                      imageController.getCoverImage(ImageSource.camera, context);
                                      Navigator.of(context).pop();
                                    }, galleryCallBack: () {
                                      imageController.getCoverImage(ImageSource.gallery, context);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: NewWidget(),
                                )
                              : Container(
                                  height: 120.0,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: FileImage(File(imageController.selectCoverImagePath.value)),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                      ),
                    ],
                  ),
                  size20,
                  textUbuntu("Embeded Video", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  AddBusinessForm(
                    hintText: "put youtube video url",
                    isSuffix: false,
                  ),

                  size10,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/stepSeven'),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        textUbuntu("Go To Step 7 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
                        Icon(
                          Icons.arrow_forward,
                          color: kPrimaryPurple,
                        )
                      ],
                    ),
                  ),
                  size20
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        child: Icon(
          Icons.add_a_photo_outlined,
          size: 60.0,
          color: Colors.blueGrey[900],
        ));
  }
}
