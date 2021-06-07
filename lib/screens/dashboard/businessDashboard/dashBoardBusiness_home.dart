import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ratingWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class HomeDashBoardBusiness extends StatefulWidget {
  @override
  _HomeDashBoardBusinessState createState() => _HomeDashBoardBusinessState();
}

class _HomeDashBoardBusinessState extends State<HomeDashBoardBusiness> {
  var txt = "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";

  var backImage = "https://i1.wp.com/www.finddoctor24.com/wp-content/uploads/2019/03/Islami-Bank-Hospital-Mugda.jpg?fit=471%2C286&ssl=1";

  var description =
      "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc. Me sumo unique argument um no. Ea alien um accustoms quo,mod summon effendi it tied.";

  var profile = "https://dsxzwbyxhnf79.cloudfront.net/productGalleries/2021/04/60753028bf116_1618292776.jpg";
  var c = Get.put(SingleBusinessAllDataController());
  var totalController = Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    c.getSingleBusinessData("new-b67867657est");
    totalController.getCtaCount("602ce10270050b2691a99bcc", "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Responsive(
      mobile: Container(
        height: size.height,
        child: GetX<SingleBusinessAllDataController>(builder: (controller) {
          return controller.loaderShow.isTrue
              ? Center(child: spinKit)
              : SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryPurple),
                                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://dsqdpdmeibwm2.cloudfront.net/${c.singleBusinessValue.value.logo}")),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                size10,
                                textUbuntu("${c.singleBusinessValue.value.location.businessName ?? "loading.."}", kBlackColor, fontWeight: weight500),
                                size5,
                                RatingBarWidget(ratingInit: c.totalReviewAvg.value),
                                size5,
                                textUbuntu(
                                    "${c.singleBusinessValue.value.location.building + ", " + c.singleBusinessValue.value.location.landMark + ", "
                                        "" + c.singleBusinessValue.value.location.city.name}",
                                    kBlackColor),
                                size5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 17,
                                    ),
                                    Text(
                                      "Verified",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.amber,
                                      size: 17,
                                    ),
                                    Text(
                                      "Trusted",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "views: 320",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          size20,
                          Row(
                            children: [
                              textUbuntu("Contributions", kPrimaryPurple),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size10,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: size.height / 18,
                                  decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textUbuntu("${controller.singleBusinessValue.value.totalReviews} Review ", kWhiteColor, fontWeight: weight500, fontSize: 14),
                                      RatingBarWidget(
                                        ratingInit: 5.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GetX<BusinessAnalyticsController>(builder: (c) {
                                return Expanded(
                                  child: Container(
                                    height: size.height / 18,
                                    decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        textUbuntu("Overall ${c.totalCount.value ?? 0} CTA click", kWhiteColor, fontWeight: weight500, fontSize: 14),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          size10,
                          Row(
                            children: [
                              textUbuntu("Payment Method", kPrimaryPurple),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size10,
                          controller.singleBusinessValue.value.acceptedPaymentMethods.length == 0
                              ? textUbuntu("No payment method found", kBlackColor)
                              : Container(
                                  height: 35,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.singleBusinessValue.value.acceptedPaymentMethods.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        //height: 25,
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(7.0)),
                                        child: Center(
                                            child: Text(
                                          controller.singleBusinessValue.value.acceptedPaymentMethods[index].name,
                                          style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                        )),
                                      );
                                    },
                                  ),
                                ),
                          size10,
                          Row(
                            children: [
                              textUbuntu("Payment Method", kPrimaryPurple),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size10,
                          controller.singleBusinessValue.value.keywords.length == 0
                              ? textUbuntu("No keywords found", kBlackColor)
                              : Container(
                                  height: 35,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.singleBusinessValue.value.keywords.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        //height: 25,
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(7.0)),
                                        child: Center(
                                            child: Text(
                                          controller.singleBusinessValue.value.keywords[index].name,
                                          style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                        )),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      )),
                );
        }),
      ),
      tablet: Container(
        height: size.height,
        child: GetX<SingleBusinessAllDataController>(builder: (controller) {
          return controller.loaderShow.isTrue
              ? Center(child: spinKit)
              : SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          size20,
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryPurple),
                                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://dsqdpdmeibwm2.cloudfront.net/${c.singleBusinessValue.value.logo}")),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                size10,
                                textUbuntu("${c.singleBusinessValue.value.location.businessName ?? "loading.."}", kBlackColor, fontWeight: weight500,fontSize: 22),
                                size10,
                                RatingBarWidget(ratingInit: c.totalReviewAvg.value,size: 22,),
                                size10,
                                textUbuntu(
                                    "${c.singleBusinessValue.value.location.building + ", " + c.singleBusinessValue.value.location.landMark + ", "
                                        "" + c.singleBusinessValue.value.location.city.name}",
                                    kBlackColor,fontSize: 20),
                                size10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 22,
                                    ),
                                    Text(
                                      "Verified",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500,fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.amber,
                                      size: 22,
                                    ),
                                    Text(
                                      "Trusted",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500,fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "views: 320",
                                      style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500,fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          size20,
                          Row(
                            children: [
                              textUbuntu("Contributions", kPrimaryPurple,fontSize: 18),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size20,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: size.height / 16,
                                  decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textUbuntu("${controller.singleBusinessValue.value.totalReviews} Review ", kWhiteColor, fontWeight: weight500, fontSize: 20),
                                      RatingBarWidget(
                                        ratingInit: 5.0,size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GetX<BusinessAnalyticsController>(builder: (c) {
                                return Expanded(
                                  child: Container(
                                    height: size.height / 16,
                                    decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        textUbuntu("Overall ${c.totalCount.value ?? 0} CTA click", kWhiteColor, fontWeight: weight500, fontSize: 20),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          size20,
                          Row(
                            children: [
                              textUbuntu("Payment Method", kPrimaryPurple,fontSize: 18),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size20,
                          controller.singleBusinessValue.value.acceptedPaymentMethods.length == 0
                              ? textUbuntu("No payment method found", kBlackColor)
                              : Container(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.singleBusinessValue.value.acceptedPaymentMethods.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(7.0)),
                                        child: Center(
                                            child: Text(
                                          controller.singleBusinessValue.value.acceptedPaymentMethods[index].name,
                                          style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500,fontSize: 18),
                                        )),
                                      );
                                    },
                                  ),
                                ),
                          size20,
                          Row(
                            children: [
                              textUbuntu("Payment Method", kPrimaryPurple,fontSize: 18),
                              Expanded(
                                  child: Divider(
                                color: kPrimaryPurple,
                                height: 2,
                              ))
                            ],
                          ),
                          size20,
                          controller.singleBusinessValue.value.keywords.length == 0
                              ? textUbuntu("No keywords found", kBlackColor)
                              : Container(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.singleBusinessValue.value.keywords.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        //height: 25,
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(7.0)),
                                        child: Center(
                                            child: Text(
                                          controller.singleBusinessValue.value.keywords[index].name,
                                          style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500,fontSize: 18),
                                        )),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      )),
                );
        }),
      ),
    ));
  }
}

/*
Row(
children: [
textUbuntu("Unread conversations", kPrimaryPurple),
Expanded(child: Divider(color: kPrimaryPurple,height: 2,))
],
),
size10,
Container(
height: size.height/6,
decoration: BoxDecoration(
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.2),
spreadRadius: 5,
blurRadius: 7,
offset: Offset(0, 3), // changes position of shadow
),
],
color: kPrimaryPurple,
borderRadius: BorderRadius.circular(10.0)
),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
textUbuntu("Ratul Rahman", kWhiteColor,fontWeight: weight500)
],
),
textUbuntu("5 minit ago", kWhiteColor.withOpacity(0.6)),

],
),
size10,
textUbuntu(txt, kWhiteColor,maxLine: 6),
size20,
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(),
textUbuntu("ratul@gmail.com", kWhiteColor),

],
)
],
),
),
),
size10,
Container(
height: 40,
decoration: BoxDecoration(
color: kPrimaryPurple,
borderRadius: BorderRadius.circular(10.0)
),
child: Center(
child: textUbuntu("See More", kWhiteColor,fontWeight: weightBold),
),
),
size10,*/

/*
Container(
height: size.height / 6,
decoration: BoxDecoration(boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.2),
spreadRadius: 5,
blurRadius: 7,
offset: Offset(0, 3), // changes position of shadow
),
], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
textUbuntu("Ratul Rahman", kPrimaryPurple, fontWeight: weight500),
size5,
textUbuntu("5 minit ago", kPrimaryPurple.withOpacity(0.6)),
],
),
RatingBarWidget(
ratingInit: 5.0,
ratingColor: kPrimaryPurple,
)
],
),
size10,
textUbuntu(txt, kPrimaryPurple.withOpacity(0.7), maxLine: 5)
],
),
),
),
size10,*/
