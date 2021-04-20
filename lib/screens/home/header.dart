import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/categoryController.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/widgets/fullScreenAlert.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class Header extends StatelessWidget {
  Header({Key key, @required this.size, this.callBack}) : super(key: key);

  final Size size;
  final Function callBack;
  var controller = TextEditingController();
  var searchController = TextEditingController();

  var items = [];

  var dummyList=["Service","Rent","B2B","Shop","Party","Hospital","House"];

  var currentAddress;

  var getController=Get.put(LocationController());
  var categoryController=Get.put(CategoryController());



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      color: kPrimaryPurple,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap:callBack,
                  child: Icon(
                    Icons.menu,
                    color: kWhiteColor,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Location",
                        style: textStyleUbuntu(
                            color: kWhiteColor.withOpacity(0.4),
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                       Obx(()=>Text(
                         getController.currentAddress.value,
                         style: textStyleUbuntu(
                             color: kWhiteColor,
                             fontSize: 14.0,
                             fontWeight: FontWeight.w500),
                       ),),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/notification'),
                child: Icon(
                  Icons.notifications,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 55.0,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: kWhiteColor.withOpacity(0.3)),
            child: GestureDetector(
              onTap: ()=>openAddEntryDialog(context),
              child: Container(
                height: 50.0,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: kWhiteColor),
                child: Row(
                  children: [
                    Icon(Icons.search,color: kPrimaryPurple,),
                    SizedBox(width: 5,),
                    textUbuntu("Search anything you want", Colors.grey)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}

//
//GestureDetector(
//onTap: () {
//showBarModalBottomSheet(
//backgroundColor: kWhiteColor,
//context: context,
//expand: true,
//builder: (context) => SingleChildScrollView(
//controller: ModalScrollController.of(context),
//child: Container(
//height: size.height,
//color: kWhiteColor,
//padding: EdgeInsets.symmetric(vertical: 5),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: [
//SizedBox(height: 20,),
//Container(
//height: 50.0,
//margin: EdgeInsets.symmetric(horizontal: 20.0),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(10.0),
//color: Colors.grey.withOpacity(0.2)
//),
//child: TextFormField(
//maxLines: 1,
//controller: searchController,
//decoration: InputDecoration(
//border: InputBorder.none,
//contentPadding: EdgeInsets.symmetric(horizontal: 10.0,),
//hintText: 'Search category',
//),
//
//),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20,top: 20),
//child: Text("or, chose a category",style: textStyleUbuntu(
//color: kBlackColor,fontSize: 16.0,fontWeight: weight500
//),),
//),
//
//GetBuilder<CategoryController>(
//init: CategoryController(),
//builder: (controller){
//return Expanded(
//child: ListView.builder(
//itemCount: controller.categoryDataClass.value.results.length,
//itemBuilder: (_, index) {
//return Padding(
//padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20,bottom: 10),
//child: GestureDetector(
//onTap: (){
//
////  controller.text=items[index].title;
//// print("title ${items[index].title}");
//Navigator.pop(context);
//
//},
//child: Row(
//children: [
//Icon(Icons.bookmark,color: kPrimaryPurple,size: 16,),
//SizedBox(width: 10.0,),
//Text(controller.categoryDataClass.value.results[index].name,style: textStyleUbuntu(
//color: kPrimaryPurple,fontSize: 18.0,fontWeight: weight500
//),),
//],
//),
//),
//);
//},
//),
//);
//},
//)
//
//
//],
//),
//),
//),
//);
//},
//child: Icon(
//Icons.dashboard,
//color: kPrimaryPurple,
//)),