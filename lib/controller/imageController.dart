
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:johukum/widgets/customToast.dart';

class ImageController extends GetxController{

  var selectLogoImagePath="".obs;
  var selectCoverImagePath="".obs;

   getLogoImage(ImageSource imageSource,BuildContext context)async{

     final pickedFile=await ImagePicker().getImage(source: imageSource);

     if(pickedFile!=null){
       selectLogoImagePath.value=pickedFile.path;
     }else{
       showSnackBar(context: context, message: "No image selected");
     }
  }


  getCoverImage(ImageSource imageSource,BuildContext context)async{

    final pickedFile=await ImagePicker().getImage(source: imageSource);

    if(pickedFile!=null){
      selectCoverImagePath.value=pickedFile.path;
    }else{
      showSnackBar(context: context, message: "No image selected");
    }
  }

}