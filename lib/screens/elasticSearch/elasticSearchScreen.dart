import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/elasticController.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/widgets/searchResultWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'businessProfile.dart';


class ElasticSearchScreen extends StatefulWidget {
  @override
  _ElasticSearchScreenState createState() => _ElasticSearchScreenState();
}

class _ElasticSearchScreenState extends State<ElasticSearchScreen> {
  var getController = Get.put(LocationController());

  var elasticController = Get.put(ElasticController());

  var searchController = TextEditingController();

  var title = ["Car rent", "Hospital", "burger", "market", "Hanif paribahan", "Pasta"];

  var scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() async {


      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        elasticController.setPaginateNumber();
        //elasticController.setListSize();
        //elasticController.setListSize();
        print("page number: ${elasticController.pageNumber.value}");
        //print("list size : ${elasticController.searchListSize.value}");

        await elasticController.getElasticData(
          text: elasticController.searchText.value,
          startForm: elasticController.pageNumber.value,
          size: elasticController.searchListSize.value,
        );
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
        title: Obx(
          () => Text(
            getController.currentAddress.value,
            style: textStyleUbuntu(color: kWhiteColor, fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            size10,
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kPrimaryPurple.withOpacity(0.2)),
              child: Row(
                children: [
                  Row(
                    children: [
                      textUbuntu("Choose Category", kBlackColor),
                      GestureDetector(onTap: () {}, child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                  Container(
                    height: 10,
                    width: 1,
                    color: kBlackColor,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      autofocus: false,
                      onChanged: (value) async {
                        elasticController.elasticDataList.clear();
                        elasticController.setSearchText(value);
                        elasticController.setPageNumberWhileSearch();

                        await elasticController.getElasticData(
                            text: elasticController.searchText.value,
                            startForm: elasticController.pageNumber.value,
                            size: elasticController.searchListSize.value);

                       /* await elasticController.fetchElasticeData(
                            text: elasticController.searchText.value,
                            startForm: elasticController.pageNumber.value,
                            size: elasticController.searchListSize.value);*/
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "serach anything you want",

                          contentPadding: EdgeInsets.only(bottom: 5, left: 10)),
                    ),
                  )
                ],
              ),
            ),
            size5,
            textUbuntu("65847+ Verified Business Enlisted", kBlackColor, fontWeight: weight400, fontSize: 16.0),
            size5,
            Divider(
              height: 1,
              color: kPrimaryPurple.withOpacity(0.3),
              endIndent: 15.0,
              indent: 15.0,
            ),
            size5,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: textUbuntu("Recent Searches", kPrimaryPurple),
                ),
              ],
            ),
            size5,
            Container(
              height: 29,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black.withOpacity(0.2))),
                    padding: EdgeInsets.all(7.0),
                    child: Center(
                      child: textUbuntu(title[index], kBlackColor.withOpacity(0.3),
                          fontSize: 12.0, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ),
            size10,
            Obx(() => elasticController.elasticDataList.length== 0
                ? textUbuntu("", kPrimaryPurple)
                : elasticController.elasticDataList == null
                ? textUbuntu("No Data Found", kPrimaryPurple, fontWeight: weight500)
                : Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: elasticController.elasticDataList.length+1,
                itemBuilder: (_, index) {
                  var dataList = elasticController.elasticDataList;
                  if (index == elasticController.elasticDataList.length)  {
                    return Center(child: Text(""));
                  }if (elasticController.elasticDataList.length == 0)  {
                    return Center(child: Text("No Data Found"));
                  }
                  return SearchItemWidget(
                    image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
                    businessName: dataList[index].sSource.businessName,
                    distance: dataList[index].sort[0].toString().substring(0, 4),
                    street: dataList[index].sSource.street,
                    size: size,
                    callBack: () {
                      print(dataList[index].sId);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusinessProfile(
                              slug: dataList[index].sSource.slug,
                              name: dataList[index].sSource.businessName,
                            )),
                      );

                      //   Navigator.pushNamed(context, '/businessProfile');
                    },
                  );
                },
              ),
            )),
            /*Obx(() => elasticController.elasticData.value.hits == null
                ? textUbuntu("", kPrimaryPurple)
                : elasticController.elasticData.value.hits.hits.length == 0
                    ? textUbuntu("No Result Found", kPrimaryPurple, fontWeight: weight500)
                    : Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: elasticController.elasticData.value.hits.hits.length,
                          itemBuilder: (_, index) {
                            var dataList = elasticController.elasticData.value.hits.hits;
                            if (index == elasticController.elasticData.value.hits.hits.length - 1) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return SearchItemWidget(
                              image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
                              businessName: dataList[index].sSource.businessName,
                              distance: dataList[index].sort[0].toString().substring(0, 4),
                              street: dataList[index].sSource.street,
                              size: size,
                              callBack: () {
                                print(dataList[index].sId);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BusinessProfile(
                                            id: dataList[index].sId,
                                            name: dataList[index].sSource.businessName,
                                          )),
                                );

                                //   Navigator.pushNamed(context, '/businessProfile');
                              },
                            );
                          },
                        ),
                      )),*/
          ],
        ),
      ),
    );
  }
}
