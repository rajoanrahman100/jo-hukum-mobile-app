
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/widgets/customToast.dart';

class ImageController extends GetxController{

  var selectLogoImagePath="".obs;
  var selectCoverImagePath="".obs;

  var selectMorePhotoOne="".obs;
  var selectMorePhotoTwo="".obs;
  var selectMorePhotoThree="".obs;

  var selectNoPhoto="".obs;

   getLogoImage(ImageSource imageSource,BuildContext context)async{

     final pickedFile=await ImagePicker().getImage(source: imageSource);

     if(pickedFile!=null){
       selectLogoImagePath.value=pickedFile.path;
     }else{
       showSnackBar(context: context, message: "No image selected",callBack: (){});
     }
  }

  getAddMorePhoto(ImageSource imageSource,BuildContext context,photoTrack)async{
    final pickedFile=await ImagePicker().getImage(source: imageSource);

    if(pickedFile!=null){
     photoTrack=="1"?selectMorePhotoOne.value=pickedFile.path:selectNoPhoto.value=pickedFile.path;
     photoTrack=="2"?selectMorePhotoTwo.value=pickedFile.path:selectNoPhoto.value=pickedFile.path;
     photoTrack=="3"?selectMorePhotoThree.value=pickedFile.path:selectNoPhoto.value=pickedFile.path;

    }else{
      showSnackBar(context: context, message: "No image selected",callBack: (){});
    }


  }


  getCoverImage(ImageSource imageSource,BuildContext context)async{

    final pickedFile=await ImagePicker().getImage(source: imageSource);

    if(pickedFile!=null){
      selectCoverImagePath.value=pickedFile.path;
    }else{
      showSnackBar(context: context, message: "No image selected",callBack: (){});
    }
  }

}