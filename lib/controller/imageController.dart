import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/customToast.dart';

class ImageController extends GetxController {
  var selectLogoImagePath = "".obs;
  var selectCoverImagePath = "".obs;

  var selectMorePhotoOne = "".obs;
  var selectMorePhotoTwo = "".obs;
  var selectMorePhotoThree = "".obs;


  setPickedLogoImage(logoValue){
    selectLogoImagePath.value=logoValue;
  }

  setPickedCoverImage(logoValue){
    selectCoverImagePath.value=logoValue;
  }

  var selectNoPhoto = "".obs;

  getLogoImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (pickedFile != null) {
      selectLogoImagePath.value = pickedFile.path;
      print("image link ${selectLogoImagePath.value}");
    } else {
      showSnackBar(context: context, message: "No image selected", callBack: () {});
    }
  }

  getAddMorePhoto(ImageSource imageSource, BuildContext context, photoTrack) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (pickedFile != null) {
      photoTrack == "1" ? selectMorePhotoOne.value = pickedFile.path : selectNoPhoto.value = pickedFile.path;
      photoTrack == "2" ? selectMorePhotoTwo.value = pickedFile.path : selectNoPhoto.value = pickedFile.path;
      photoTrack == "3" ? selectMorePhotoThree.value = pickedFile.path : selectNoPhoto.value = pickedFile.path;
    } else {
      showSnackBar(context: context, message: "No image selected", callBack: () {});
    }
  }

  getCoverImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (pickedFile != null) {
      selectCoverImagePath.value = pickedFile.path;
      print(selectCoverImagePath.value);
    } else {
      showSnackBar(context: context, message: "No image selected", callBack: () {});
    }
  }


}
