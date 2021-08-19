import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/addBusinessController.dart';
import 'package:johukum/controller/businessTagController.dart';
import 'package:johukum/controller/imageController.dart';
import 'package:johukum/controller/keywordController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/addBusiness/uploadMultipleImage.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenKeyword.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';


class StepSixScreen extends StatefulWidget {
  @override
  _StepSixScreenState createState() => _StepSixScreenState();
}

class _StepSixScreenState extends State<StepSixScreen> {
  var imageController = Get.put(ImageController());

  var keywordController = Get.put(KeywordController());

  var tagController = Get.put(BusinessTagController());

  var businessController = Get.put(AddBusinessController());

  var titleSeo=TextEditingController();

  var metaDesc=TextEditingController();

  var tag = TextEditingController();

  var up=UploadMultipleImage();

  var taglist=["Test Tag1,Test Tag2,Test Tag3"];

  var stringId;

  File _image;

  Map map;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 3"),
      body: Container(
        height: size.height,
        child: Responsive(
            mobile: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textUbuntu("Business Logo", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                        width5,
                        GestureDetector(onTap: (){

                        },child: Icon(Icons.info,color: kPrimaryPurple,size: 17,)),

                      ],
                    ),
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

                                                  //getImage();
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
                    Row(
                      children: [
                        textUbuntu("Business Cover Photo", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                        width5,
                        GestureDetector(onTap: (){

                        },child: Icon(Icons.info,color: kPrimaryPurple,size: 17,)),

                      ],
                    ),
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
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0)),
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
                              //getCoverFromCamera();
                              buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                imageController.getCoverImage(ImageSource.camera, context);
                                Navigator.of(context).pop();
                              }, galleryCallBack: () {
                                imageController.getCoverImage(ImageSource.gallery, context);
                                Navigator.of(context).pop();
                              });
                            },
                            child: textUbuntu("Upload Cover Photo", kPrimaryPurple,
                                fontSize: 16.0, fontWeight: weight500)),
                      ],
                    ),
                    size20,
                    Row(
                      children: [
                        textUbuntu("Add More Photos", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                        width10,
                        GestureDetector(
                            onTap: () {
                              buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                imageController.getGalleryPhotos(ImageSource.camera, context);
                                Navigator.of(context).pop();
                              }, galleryCallBack: () {
                                imageController.getGalleryPhotos(ImageSource.gallery, context);
                                Navigator.of(context).pop();
                              });
                            },
                            child: Icon(
                              Icons.add_circle,
                              size: 25,
                              color: kPrimaryPurple,
                            )),
                      ],
                    ),
                    size20,
                    Obx(() => imageController.galleryImage.length == 0
                        ? Container(
                            child: Center(child: textUbuntu("No Photos Add", kPrimaryPurple, fontSize: 18.0)),
                          )
                        : Container(
                            height: 120,
                            //color: Colors.grey,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageController.galleryImage.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () => imageController.galleryImage.removeAt(index),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                                image: FileImage(File(imageController.galleryImage[index])),
                                                fit: BoxFit.cover)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 7.0),
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )),
                    size20,
                    textUbuntu("Embeded Video", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "put youtube video url",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Title for SEO", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    AddBusinessForm(
                      controller: titleSeo,
                      hintText: "",
                      isSuffix: false,
                      onSave: (String value){
                        titleSeo.text=value;
                      },
                    ),
                    size10,
                    textUbuntu("Meta Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    size5,
                    AddBusinessForm(
                      controller: metaDesc,
                      textInputType: TextInputType.text,
                      hintText: "",
                      //height: 40.0,
                      maxLine: 6,
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Add Business Tag", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AddBusinessForm(
                            controller: tag,
                            hintText: "",
                            isSuffix: false,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            tagController.addTagList(tag.text);
                            tag.clear();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
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
                    size10,
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 30, child: Center(child: textUbuntu("Tags: ", kPrimaryPurple, fontWeight: weight500))),
                        Obx(
                              () => tagController.tagList.length == 0
                              ? Container(
                              height: 30, child: Center(child: textUbuntu("No tagg added", kPrimaryPurple, fontWeight: weight400)))
                              : Expanded(
                            child: Container(
                              height: 30,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: tagController.tagList.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      tagController.tagList.removeAt(index);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          //color: kPrimaryPurple,
                                          borderRadius: BorderRadius.circular(5.0),
                                          //border: Border.all(color: Colors.black.withOpacity(0.2))
                                        ),
                                        child: Row(
                                          children: [
                                            textUbuntu(tagController.tagList[index], kPrimaryPurple,fontWeight:
                                            weight500,fontSize: 16),
                                            SizedBox(width: 2,),
                                            Icon(Icons.cancel,color: kPrimaryPurple,size: 16,)
                                          ],
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    size10,
                    GestureDetector(
                      onTap: () async {

                        map={
                          "gallery photo":imageController.galleryImage,
                          "title seo":titleSeo.text,
                          "meta desc":metaDesc.text,
                          "image tags":tagController.tagList,
                        };

                        print(map);

                        // await keywordController.fetchKeyword();
                        boxStorage.write(SEO_TITLE, titleSeo.text??"seo title");
                        boxStorage.write(META_DESCRIPTION, metaDesc.text??"meta description");
                        boxStorage.write(TAG_LIST, tagController.tagList??taglist);
                        boxStorage.write(MORE_PHOTOS, imageController.splitString.value);

                        openKeywordDialog(context);
                      },
                      child: Row(
                        children: [
                          textUbuntu("Select Keywords  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                          Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                            size: 19,
                          )
                        ],
                      ),
                    ),
                    size10,
                    Obx(() => keywordController.keywordList.length == 0
                        ? Container(
                      child: Center(
                        child: textUbuntu("No keywords selected", kPrimaryPurple),
                      ),
                    )
                        : Container(
                      height: 30,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: keywordController.keywordList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            //height: 17,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryPurple,
                              borderRadius: BorderRadius.circular(5.0),
                              //border: Border.all(color: Colors.black.withOpacity(0.2))
                            ),
                            padding: EdgeInsets.all(7.0),
                            child: Center(
                              child: textUbuntu(keywordController.keywordList[index], kWhiteColor,
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          );
                        },
                      ),
                    )),
                    size20,
                    GestureDetector(
                      onTap: () {



                        //Navigator.pushNamed(context, '/stepSeven');
                        //print(imageController.idArray);

                        //stringId=imageController.idArray.reduce((previousValue, element) => previousValue+","+element);
                        //print(stringId);
                        //uploadImageFunction(File(imageController.selectMorePhotoOne.value),context);

                        //imageController.upload(File(imageController.selectLogoImagePath.value));

                        /*if (imageController.selectLogoImagePath.value.isEmpty) {
                          return showErrorToast("Select business logo");
                        } else if (imageController.selectCoverImagePath.value.isEmpty) {
                          return showErrorToast("Select business cover photo");
                        } else {

                          Navigator.pushNamed(context, '/stepSeven');
                        }*/
                      },
                      child: Row(
                        mainAxisAlignment: mainAxisAlignmentBetween,
                        children: [
                          GestureDetector(
                            onTap: ()=>Navigator.of(context).pop(),
                            child: Container(

                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios,color: kPrimaryPurple,),
                                  textUbuntu("back",kPrimaryPurple,fontSize: 18.0,fontWeight: weight500),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{

                              if(keywordController.keywordList.length==0){
                                return showErrorToast("At least one keyword is required");
                              }else{

                                await businessController.addBusinessData(context,imageController.selectLogoImagePath.value,
                                    imageController.selectCoverImagePath.value,imageController.idArray);
                                ///Business Info

                              }
                            },
                            child: Container(
                              height: 40.0,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: containerBoxDecoration(
                                  borderRadius: 10.0,
                                  color: kPrimaryPurple
                              ),
                              child: Center(child: textUbuntu("Complete Registration", Colors.white, fontWeight: weightBold, fontSize: 16.0)),
                            ),
                          ),
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
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: FileImage(File(imageController.selectLogoImagePath.value)),
                                                      fit: BoxFit.cover)),
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
                                                  /*buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                                    imageController.getLogoImage(ImageSource.camera, context);
                                                    Navigator.of(context).pop();
                                                  }, galleryCallBack: () {
                                                    imageController.getLogoImage(ImageSource.gallery, context);
                                                    Navigator.of(context).pop();
                                                  });*/
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
                                /*getCoverFromCamera();
                                buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                  imageController.getCoverImage(ImageSource.camera, context);
                                  Navigator.of(context).pop();
                                }, galleryCallBack: () {
                                  imageController.getCoverImage(ImageSource.gallery, context);
                                  Navigator.of(context).pop();
                                });*/
                              },
                              child: Container(
                                  height: 250.0,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0)),
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
                              //getCoverFromCamera();
                              /*buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                imageController.getCoverImage(ImageSource.camera, context);
                                Navigator.of(context).pop();
                              }, galleryCallBack: () {
                                imageController.getCoverImage(ImageSource.gallery, context);
                                Navigator.of(context).pop();
                              });*/
                            },
                            child: textUbuntu("Upload Cover Photo", kPrimaryPurple,
                                fontSize: 18.0, fontWeight: weight500)),
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
                                      /*buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "1");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "1");
                                        Navigator.of(context).pop();
                                      });*/
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
                                        image: DecorationImage(
                                            image: FileImage(File(imageController.selectMorePhotoOne.value)),
                                            fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoTwo.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      /*buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "2");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "2");
                                        Navigator.of(context).pop();
                                      });*/
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
                                        image: DecorationImage(
                                            image: FileImage(File(imageController.selectMorePhotoTwo.value)),
                                            fit: BoxFit.cover)),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => imageController.selectMorePhotoThree.value == ""
                                ? GestureDetector(
                                    onTap: () {
                                      /*buildShowBarModalBottomSheet(context, cameraCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.camera, context, "3");
                                        Navigator.of(context).pop();
                                      }, galleryCallBack: () {
                                        imageController.getAddMorePhoto(ImageSource.gallery, context, "3");
                                        Navigator.of(context).pop();
                                      });*/
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
                                        image: DecorationImage(
                                            image: FileImage(File(imageController.selectMorePhotoThree.value)),
                                            fit: BoxFit.cover)),
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
                        } else {
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
