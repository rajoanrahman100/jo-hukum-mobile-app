import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/imageController.dart';
import 'package:johukum/modelClass/singleImageModel.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:path/path.dart';

class StepSixScreen extends StatelessWidget {
  var imageController = Get.put(ImageController());

  final picker = ImagePicker();

  //var idArray=[];

  var stringId;

  uploadImageFunction(File imageFile, context) async {
    print('----------------------------------> upload start');
    var stream = new http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var uri = Uri.parse(uploadImagesAPi);
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('image', stream, length, filename: basename(imageFile.path), contentType: MediaType('image', 'jpeg'));

    request.headers.addAll(
      <String, String>{
        'Authorization': boxStorage.read(KEY_TOKEN),
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    request.files.add(multipartFile);
    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    print(responseBody.statusCode);
    print(responseBody.body);

    var dataMap = jsonDecode(responseBody.body);
    SingleImageModel singelImageModel = SingleImageModel.fromJson(dataMap);
    //idArray.add(singelImageModel.sId);
  }

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
                      height: size.height / 4,
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
                                              decoration:
                                                  BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: FileImage(File(imageController.selectLogoImagePath.value)), fit: BoxFit.cover)),
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
                                                  //getLogoFromCamera();

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
                                //getCoverFromCamera();
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
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10.0)),
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
                                  image: DecorationImage(image: FileImage(File(imageController.selectCoverImagePath.value)), fit: BoxFit.cover)),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //getCoverFromCamera();
                              buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                getCoverFromCamera();
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
                            () => imageController.selectMorePhotoOne.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "1");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "1");
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
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoOne.value)), fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoTwo.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "2");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "2");
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
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoTwo.value)), fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoThree.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "3");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "3");
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
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoThree.value)), fit: BoxFit.cover)),
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
                      onTap: () {
                        //print(imageController.idArray);

                        //stringId=imageController.idArray.reduce((previousValue, element) => previousValue+","+element);
                        //print(stringId);
                        //uploadImageFunction(File(imageController.selectMorePhotoOne.value),context);

                        //imageController.upload(File(imageController.selectLogoImagePath.value));

                        if (imageController.selectLogoImagePath.value.isEmpty) {
                          return showErrorToast("Select business logo");
                        } else if (imageController.selectCoverImagePath.value.isEmpty) {
                          return showErrorToast("Select business cover photo");
                        }else{
                         // boxStorage.write(MORE_PHOTOS, imageController.splitString.value);
                          Navigator.pushNamed(context, '/stepSeven');
                        }

                      },
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
            tablet: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textUbuntu("Business Logo", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500),
                    Container(
                      height: size.height / 4,
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
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: Colors.black),
                                                image: new DecorationImage(
                                                  image: new ExactAssetImage('assets/images/johukuminfologo.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ))
                                          : Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration:
                                                  BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: FileImage(File(imageController.selectLogoImagePath.value)), fit: BoxFit.cover)),
                                            ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 90.0, right: 120.0),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new CircleAvatar(
                                            backgroundColor: kPrimaryPurple,
                                            radius: 25.0,
                                            child: new IconButton(
                                                onPressed: () {
                                                  //getLogoFromCamera();
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
                    textUbuntu("Business Cover Photo", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500),
                    size20,
                    Obx(
                      () => imageController.selectCoverImagePath.value == ""
                          ? GestureDetector(
                              onTap: () {
                                //getCoverFromCamera();
                                buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                  imageController.getCoverImage(ImageSource.camera, context);
                                  Navigator.of(context).pop();
                                }, galleryCallBack: () {
                                  imageController.getCoverImage(ImageSource.gallery, context);
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Container(
                                  height: 250.0,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10.0)),
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 80.0,
                                    color: Colors.blueGrey[900],
                                  )),
                            )
                          : Container(
                              height: 250.0,
                              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(image: FileImage(File(imageController.selectCoverImagePath.value)), fit: BoxFit.cover)),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //getCoverFromCamera();
                              buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                imageController.getCoverImage(ImageSource.camera, context);
                                Navigator.of(context).pop();
                              }, galleryCallBack: () {
                                imageController.getCoverImage(ImageSource.gallery, context);
                                Navigator.of(context).pop();
                              });
                            },
                            child: textUbuntu("Upload Cover Photo", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500)),
                      ],
                    ),
                    size20,
                    textUbuntu("Add More Photos", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500),
                    size20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoOne.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "1");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "1");
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: NewWidget(
                                      height: 140.0,
                                    ),
                                  )
                                : Container(
                                    height: 140.0,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoOne.value)), fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoTwo.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "2");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "2");
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: NewWidget(
                                      height: 140.0,
                                    ),
                                  )
                                : Container(
                                    height: 140.0,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoTwo.value)), fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoThree.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "3");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "3");
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: NewWidget(
                                      height: 140.0,
                                    ),
                                  )
                                : Container(
                                    height: 140.0,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(image: FileImage(File(imageController.selectMorePhotoThree.value)), fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    size20,
                    textUbuntu("Embeded Video", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "put youtube video url",
                      isSuffix: false,
                    ),
                    size10,
                    GestureDetector(
                      onTap: () {
                       // print(imageController.idArray);
                        print("covers ${boxStorage.read(MORE_PHOTOS)}");
                        //uploadImageFunction(File(imageController.selectMorePhotoOne.value),context);

                        //imageController.upload(File(imageController.selectLogoImagePath.value));

                        if (imageController.selectLogoImagePath.value.isEmpty) {
                          return showErrorToast("Select business logo");
                        } else if (imageController.selectCoverImagePath.value.isEmpty) {
                          return showErrorToast("Select business cover photo");
                        }else{
                          //boxStorage.write(COVER_PHOTOS,imageController.idArray);
                        }
                        Navigator.pushNamed(context, '/stepSeven');
                      },
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
            )),
      ),
    );
  }

  Future getLogoFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera, imageQuality: 20);
    print("camera image");

    imageController.setPickedLogoImage(image.path);
  }

  Future getCoverFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera, imageQuality: 20);
    print("cover image");

    imageController.setPickedCoverImage(image.path);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.height,
  }) : super(key: key);

  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 120.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10.0)),
        child: Icon(
          Icons.add_a_photo_outlined,
          size: 60.0,
          color: Colors.blueGrey[900],
        ));
  }
}
