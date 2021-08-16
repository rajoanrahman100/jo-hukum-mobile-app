import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/messageController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';


class SendMessageScreen extends StatelessWidget {

  var businessID;

  SendMessageScreen({this.businessID});

  var messageController=TextEditingController();
  var sendMessageController=Get.put(MessageController());

  @override
  Widget build(BuildContext context) {

    
    Size size=MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        title: Column(
          crossAxisAlignment: crossAxisAlignmentStart,
          children: [
            textUbuntu("Send Message", kWhiteColor,fontSize: 14.0),
            textUbuntu("if you find any problem or know something", kWhiteColor.withOpacity(0.7),fontSize: 14.0),
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: crossAxisAlignmentStart,
            children: [




              AddBusinessForm(
                controller: messageController,
                textInputType: TextInputType.text,
                hintText: "write your message",
                //height: 40.0,
                maxLine: 7,
                isSuffix: false,
              ),
              boxStorage.read(KEY_TOKEN)!=null?WelcomeScreenButton(
                height: 50,
                borderRadiusGeometry: BorderRadius.circular(10.0),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                buttonText: "Submit",
                buttonColor: kPrimaryPurple,
                textColor: kWhiteColor,
                isIcon: false,
                callback: (){
                  sendMessageController.sendMessage(businessID, messageController.text);
                },
              ):
              WelcomeScreenButton(
                height: 50,
                borderRadiusGeometry: BorderRadius.circular(10.0),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                buttonText: "Submit",
                buttonColor: kPrimaryPurple,
                textColor: kWhiteColor,
                isIcon: false,
                callback: (){
                  showSnackBar(context: context, message: "You need to log in first",callBack: (){});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}



void openSendMessageDialog(BuildContext context,businessID) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return SendMessageScreen(businessID: businessID,);
      },
      fullscreenDialog: true));
}