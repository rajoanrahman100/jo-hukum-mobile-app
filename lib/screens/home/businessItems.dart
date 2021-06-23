import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/categoryBusinessDataController.dart';
import 'package:johukum/controller/connectivityController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/elasticSearch/businessProfile.dart';
import 'package:johukum/widgets/noInternetConnectionWiget.dart';
import 'package:johukum/widgets/searchResultWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class BusinessItems extends StatefulWidget {
  String id;
  String businessName;

  BusinessItems(this.id, this.businessName);

  @override
  _BusinessItemsState createState() => _BusinessItemsState();
}

class _BusinessItemsState extends State<BusinessItems> {
  var c = Get.put(CategoryBusinessDataController());
  var scrollController = ScrollController();

  var checkConnect = Get.put(ConnectivityController());

  @override
  void initState() {
    // TODO: implement initState
    checkConnect.startMonitoring();

    c.getBusinessData(startForm: c.pageNumber.value, size: 10, catID: widget.id);
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        c.pageNumber.value = c.pageNumber.value + 10;
        print("page number: ${c.pageNumber.value}");
        //print("list size : ${elasticController.searchListSize.value}");
        await c.getBusinessData(startForm: c.pageNumber.value, size: c.searchListSize.value, catID: widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        elevation: 0.0,
        title: Text(
          widget.businessName,
          style: textStyleUbuntu(color: kWhiteColor, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: Responsive(
        mobile: Obx(() => Stack(
              children: [
                Container(
                  height: size.height,
                  child: c.businessDataList.length == 0
                      ? Center(child: spinKit)
                      : c.businessDataList == null
                          ? textUbuntu("No Data Found", kPrimaryPurple, fontWeight: weight500)
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: c.businessDataList.length,
                              itemBuilder: (_, index) {
                                var dataList = c.businessDataList;

                                index == c.businessDataList.length - 1
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        backgroundColor: kPrimaryPurple,
                                      ))
                                    : Text("");

                                if (c.businessDataList.length == 0) {
                                  return Center(child: Text("No Data Found"));
                                }
                                return SearchItemWidget(
                                  image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
                                  businessName: dataList[index].sSource.businessName,
                                  distance: dataList[index].sort[0].toString().substring(0, 4),
                                  street: "${dataList[index].sSource.street},${dataList[index].sSource.area}",
                                  size: size,
                                  rating: dataList[index].sSource.aggregateRating,
                                  callBack: () {
                                    print(dataList[index].sId);
                                    Get.to(() => BusinessProfile(slug: dataList[index].sSource.slug, name: dataList[index].sSource.businessName, id: dataList[index].sId));
                                  },
                                );
                              },
                            ),
                ),
                checkConnect.isOnline.value == true ? Align(alignment: Alignment.bottomCenter, child: Container()) : NoInterConnectionWidget(size: size)
              ],
            )),
        tablet: Obx(() => Stack(
              children: [
                Container(
                  height: size.height,
                  child: c.businessDataList.length == 0
                      ? Center(child: spinKit)
                      : c.businessDataList == null
                          ? textUbuntu("No Data Found", kPrimaryPurple, fontWeight: weight500)
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: c.businessDataList.length,
                              itemBuilder: (_, index) {
                                var dataList = c.businessDataList;

                                index == c.businessDataList.length - 1
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        backgroundColor: kPrimaryPurple,
                                      ))
                                    : Text("");

                                if (c.businessDataList.length == 0) {
                                  return Center(child: Text("No Data Found"));
                                }
                                return SearchItemWidget(
                                  image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
                                  businessName: dataList[index].sSource.businessName,
                                  distance: dataList[index].sort[0].toString().substring(0, 4),
                                  street: "${dataList[index].sSource.street},${dataList[index].sSource.area}",
                                  size: size,
                                  imageHeight: 135.0,
                                  titleFontSize: 26.0,
                                  distanceFontSize: 20.0,
                                  addressFontSize: 22.0,
                                  addressConHeight: 38.0,
                                  addressConWidth: 85.0,
                                  height: size.height / 4,
                                  callBack: () {
                                    print(dataList[index].sId);
                                    Get.to(() => BusinessProfile(
                                          slug: dataList[index].sSource.slug,
                                          name: dataList[index].sSource.businessName,
                                          id: dataList[index].sId,
                                        ));

                                    //   Navigator.pushNamed(context, '/businessProfile');
                                  },
                                );
                              },
                            ),
                ),
                checkConnect.isOnline.value == true ? Align(alignment: Alignment.bottomCenter, child: Container(color: Colors.transparent,)) : NoInterConnectionWidget(size: size)
              ],
            )),
      ),
    );
  }
}

/*SearchItemWidget(
image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
businessName: dataList[index].sSource.businessName,
distance: dataList[index].sort[0].toString().substring(0, 4),
street: dataList[index].sSource.street,
size: size,
imageHeight: 135.0,
titleFontSize: 26.0,
distanceFontSize: 20.0,
addressFontSize: 22.0,
addressConHeight: 38.0,
addressConWidth: 85.0,
height: size.height / 4,
callBack: () {
print(dataList[index].sId);
Get.to(() => BusinessProfile(
slug: dataList[index].sSource.slug,
name: dataList[index].sSource.businessName,
id: dataList[index].sId,
));

//   Navigator.pushNamed(context, '/businessProfile');
},
);*/
