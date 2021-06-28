import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:johukum/components/config.dart';

class UploadMultipleImage{


  var dio=Dio();

  uploadImages(File logoImage,File coverImage,businessID,gallery)async{

    print("--------uplod image start----------");

    print("imageFile ${logoImage.path}");
    print("coverFile ${coverImage.path}");
    print("Token ${boxStorage.read(KEY_TOKEN)}");

    String logoImageFile=logoImage.path.split("/").last;
    String coverImageFile=coverImage.path.split("/").last;

    var formData=FormData.fromMap({
      "logo":await MultipartFile.fromFile(logoImage.path,
          contentType: new MediaType("image", "jpeg")),
      "cover_photo":await MultipartFile.fromFile(coverImage.path,
      contentType: new MediaType("image", "jpeg"))
      //"photos":gallery
    });

    print("data ${formData.toString()}");

    var response=await dio.patch("https://api-backend.jo-hukum.com/consumers_api/business_data/$businessID/uploads/",data:
    formData,
    options: Options(
      headers: {
        "Content-Type":"multipart/form-data",
        "Authorization":boxStorage.read(KEY_TOKEN)
      }
    ),onSendProgress: (int sent, int total) {
      debugPrint("sent${sent.toString()}" + " total${total.toString()}");
    },);

    if(response.statusCode==200 ||response.statusCode==201){
      print(response.data);
    }else{
      print ("errors ${response.data}");
    }

    //print("status Code: ${response.statusCode}");

  }
}