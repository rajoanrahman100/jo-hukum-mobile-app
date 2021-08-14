import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/singleImageModel.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageController extends GetxController {
  var selectLogoImagePath = "".obs;
  var selectCoverImagePath = "".obs;

  var selectMorePhotoOne = "".obs;
  var selectMorePhotoTwo = "".obs;
  var selectMorePhotoThree = "".obs;

  var idArray=[].obs;
  var splitString=" ".obs;

  var galleryImage=[].obs;

  addImageToGallery(value){
    galleryImage.add(value);
    print("image length ${galleryImage.length}");
    print("image $galleryImage");
  }

  addImageId(value){
    idArray.add('"$value"');
    splitString.value=idArray.reduce((previousValue, element) => previousValue+","+element);
    print(splitString.value);
    print(idArray);
  }



  setPickedLogoImage(logoValue){
    selectLogoImagePath.value=logoValue;
  }

  setPickedCoverImage(logoValue){
    selectCoverImagePath.value=logoValue;
  }

  var selectNoPhoto = "".obs;

  getLogoImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource,imageQuality: 50);

    if (pickedFile != null) {

      var file=await ImageCropper.cropImage(sourcePath: pickedFile.path,aspectRatio: CropAspectRatio(ratioX: 1,
          ratioY: 1));

      //file=await testCompressAndGetFile(file.path,"");

      selectLogoImagePath.value=file.path;

      //selectLogoImagePath.value = pickedFile.path;
      print("image link ${selectLogoImagePath.value}");
    } else {
      showSnackBar(context: context, message: "No image selected", callBack: () {});
    }
  }

  Future<File> testCompressAndGetFile(String path, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      path, targetPath,
      quality: 35,
      rotate: 90,
    );

    //print(file.lengthSync());
    //print(result.lengthSync());

    return result;
  }


  getGalleryPhotos(ImageSource imageSource, BuildContext context)async{
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if(pickedFile != null){

      //galleryImage.add(pickedFile.path);

      addImageToGallery(pickedFile.path);
      uploadImageFunction(File(pickedFile.path),context);

    }else {
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



  uploadImageFunction(File imageFile, context) async {
    print('----------------------------------> upload start');
    var stream = new http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var uri = Uri.parse(uploadImagesAPi);
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('image', stream, length, filename: basename(imageFile.path),
        contentType:MediaType('image','jpeg'));

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
    SingleImageModel singelImageModel=SingleImageModel.fromJson(dataMap);
    addImageId(singelImageModel.sId);

    //idArray.add(singelImageModel.sId);

  }



}
