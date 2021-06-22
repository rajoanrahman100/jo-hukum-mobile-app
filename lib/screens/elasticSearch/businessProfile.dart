import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/businessProfileController.dart';
import 'package:johukum/controller/passController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/elasticSearch/businessReviews.dart';
import 'package:johukum/screens/web_view.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:maps_launcher/maps_launcher.dart';

class BusinessProfile extends StatefulWidget {
  String slug;
  String name;
  String id;

  BusinessProfile({this.slug, this.name,this.id});

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var backImage = "https://i1.wp.com/www.finddoctor24.com/wp-content/uploads/2019/03/Islami-Bank-Hospital-Mugda.jpg?fit=471%2C286&ssl=1";

  var description =
      "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc. Me sumo unique argument um no. Ea alien um accustoms quo,mod summon effendi it tied.";

  var profile =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/158261324_226608225830377_8521737132345272932_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=PivMlip5C94AX8C38PS&_nc_ht=scontent.fdac116-1.fna&oh=ece9ef74fbfee93d213a6c1e8437438d&oe=60967998";

  var profile2 =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/s960x960/172139378_246438640514002_2991380741640275172_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=8vxsgEpGYdkAX-DthXH&_nc_ht=scontent.fdac116-1.fna&tp=7&oh=e24c1c1e7f00c34adc466425d21997fa&oe=60991120";

  var businessProfileController = Get.put(BusinessProfileController());

  var ratingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var passController = Get.put(PassWordController());
  var numberController = TextEditingController();
  var passWordController = TextEditingController();

  var ratingValue;



  callNumber(number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  void initState() {
    // TODO: implement initState
    businessProfileController.getBusinessData(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // businessProfileController.getBUsinessData(id);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          title: Text(
            widget.name,
            style: textStyleUbuntu(color: kWhiteColor, fontSize: 16),
          ),
          iconTheme: IconThemeData(color: kWhiteColor),
        ),
        body: Responsive(
          mobile: Container(
              height: size.height,
              child: GetX<BusinessProfileController>(builder: (controller) {
                var obj = controller.businessDataModel.value;

                return controller.loaderShow.isTrue
                    ? Center(child: spinKit)
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.3,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.coverPhoto}",
                                    height: size.height * 0.2,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => spinKit,
                                    errorWidget: (context, url, error) => Image.asset("assets/images/no_image.jpg",height:size.height * 0.2,width: double.infinity,fit: BoxFit.cover,),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child:Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: kPrimaryPurple),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(60.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(60.0),
                                          child: CachedNetworkImage(
                                            imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.logo}",
                                            //height: 120,
                                            //width: 120,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => spinKit,
                                            errorWidget: (context, url, error) => Image.asset("assets/images/johukuminfologo.png",height: 80.0,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => RatingBar.builder(
                                    initialRating: businessProfileController.ratingValue.value,
                                    minRating: 1,
                                    itemSize: 23.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Text(
                                  " (${obj.aggregateRating.toStringAsFixed(1)??0.0})",
                                  style: textStyleUbuntu(color: kBlackColor, fontSize: 16, fontWeight: weight500),
                                )
                              ],
                            ),
                            size20,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "${controller.businessDataModel.value.llocation.businessName ?? ""}",
                                style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weightBold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Verified",
                                  style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(Icons.verified, color: Colors.amber),
                                Text(
                                  "Trusted",
                                  style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text("Reviews: ",
                                    style: textStyleUbuntu(
                                      color: kBlackColor,
                                      fontWeight: weight500,
                                    )),
                                Text("${obj.totalReviews}", style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("${widget.id}");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BusinessReview(
                                                reviews: obj.reviews,
                                                businesssID: widget.id,
                                                businessName: obj.llocation.businessName,
                                                slug: widget.slug,
                                              )),
                                    );
                                  },
                                  child: Text("See reviews", style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weightBold, textDecoration: TextDecoration.underline)),
                                ),
                              ],
                            ),
                            size20,
                            Row(
                              children: [
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 40,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Call Now",
                                    textColor: kWhiteColor,
                                    fontSize: 18.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: kPrimaryPurple,
                                    isIcon: true,
                                    callback: () {
                                      obj.contact.mobileNumbers.length == 0
                                          ? showSnackBar(
                                              context: context,
                                              message: "No "
                                                  "Contact Found")
                                          : callNumber(obj.contact.mobileNumbers[0].mobileNumber);
                                    },
                                    iconData: Icon(
                                      Icons.call,
                                      color: kWhiteColor,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 40,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Send Message",
                                    textColor: kBlackColor,
                                    fontSize: 18.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.amber,
                                    isIcon: true,
                                    iconData: Icon(
                                      Icons.message,
                                      color: kBlackColor,
                                      size: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            size10,
                            Row(
                              children: [
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 40,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Map Location",
                                    textColor: kWhiteColor,
                                    fontSize: 18.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.red[600],
                                    isIcon: true,
                                    callback: () {
                                      MapsLauncher.launchCoordinates(obj.llocation.geo.coordinates[1], obj.llocation.geo.coordinates[0], obj.llocation.businessName);

                                      // MapUtils.openMap(23.6850, 90.3563);
                                      print("${obj.llocation.geo.coordinates[0]}");
                                    },
                                    iconData: Icon(
                                      Icons.location_on,
                                      color: kWhiteColor,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 40,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Website",
                                    textColor: kWhiteColor,
                                    fontSize: 18.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.black.withOpacity(0.7),
                                    isIcon: true,
                                    callback: () {
                                      print(obj.contact.website);
                                      obj.contact.website == null
                                          ? showSnackBar(context: context, message: "No Website Found",callBack:() {})
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => WebViewExample(
                                                        url: obj.contact.website,
                                                      )),
                                            );
                                      // launchURL("https://www.google.com");
                                    },
                                    iconData: Icon(
                                      Icons.open_in_browser_rounded,
                                      color: kWhiteColor,
                                      size: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            size20,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                obj.description ?? "No Description Found",
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: textStyleUbuntu(color: kBlackColor, fontWeight: weight400, fontSize: 16.0),
                              ),
                            ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Business Information",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: textUbuntu("Address",kBlackColor)),
                                  Text(": "),
                                  Expanded(
                                      flex: 2,
                                      child:
                                      textUbuntu("${obj.llocation.landMark??""} , ${obj.llocation.area??""}",kBlackColor,maxLine: 2))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: textUbuntu("Call",kBlackColor)),
                                  Text(": "),
                                  obj.contact.mobileNumbers.length == 0
                                      ? Expanded(flex: 2, child: Text("No Contact Found"))
                                      : Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 14,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: obj.contact.mobileNumbers.length,
                                              itemBuilder: (_, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                  child: textUbuntu(obj.contact.mobileNumbers[index].mobileNumber,kBlackColor),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [Expanded(flex: 1, child: textUbuntu("Website",kBlackColor)),
                                  Text(": "), Expanded(flex: 2, child: textUbuntu(obj.contact.website ?? "No website found",kBlackColor))],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: size.height * 0.2,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Working hour",kBlackColor)),
                                              Text(" : "),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: size.height * 0.2,
                                      padding: EdgeInsets.only(left: 2.0, right: 10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Saturday",kBlackColor)),
                                              obj.hoursOfOperation.saturday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Sunday",kBlackColor)),
                                              obj.hoursOfOperation.sunday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Monday",kBlackColor)),
                                              obj.hoursOfOperation.monday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Tuesday",kBlackColor)),
                                              obj.hoursOfOperation.tuesday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Wednesday",kBlackColor)),
                                              obj.hoursOfOperation.wednesday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Thursday",kBlackColor)),
                                              obj.hoursOfOperation.thursday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Friday",kBlackColor)),
                                              obj.hoursOfOperation.friday.close == true
                                                  ? Text("- Closed")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Payment Method",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size20,
                            obj.acceptedPaymentMethods.length == 0
                                ? Text("No payment methid found")
                                : Container(
                                    height: 35,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.acceptedPaymentMethods.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                          //height: 25,
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                                            obj.acceptedPaymentMethods[index].name,
                                            style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Photos",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size10,
                            obj.photos.length == 0
                                ? Text("No Photos Found")
                                : Container(
                                    height: size.height * 0.2,
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.photos.length,
                                      itemBuilder: (_, index) {
                                        return  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.photos[index].image}",
                                                height:size.height * 0.2,
                                                width:200,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) => spinKit,
                                                errorWidget: (context, url, error) => Icon(
                                                  Icons.error,
                                                  color: kPrimaryPurple,
                                                  size: 22,
                                                ),
                                              ),
                                            ),
                                          );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Keywords",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size20,
                            obj.keywords.length == 0
                                ? Text("No keywords found")
                                : Container(
                                    height: 35,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.keywords.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                          //height: 25,
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                                            obj.keywords[index].name,
                                            style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                          ],
                        ),
                      );
              })),
          tablet: Container(
              height: size.height,
              child: GetX<BusinessProfileController>(builder: (controller) {
                var obj = controller.businessDataModel.value;
                return controller.loaderShow.isTrue
                    ? Center(child: spinKit)
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.4,
                              width: double.infinity,
                              child: Stack(
                                children: [

                                  CachedNetworkImage(
                                    imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.coverPhoto}",
                                    height: size.height * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => spinKit,
                                    errorWidget: (context, url, error) => Image.asset("assets/images/no_image.jog",height: size.height * 0.3,width: size.width,fit: BoxFit.cover,),
                                  ),
                                  /*Image.network(
                                    "https://dsqdpdmeibwm2.cloudfront.net/${obj.coverPhoto}",
                                    height: size.height * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),*/
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child:Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: kPrimaryPurple),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(80.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(80.0),
                                          child: CachedNetworkImage(
                                            imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.logo}",
                                            //height: 120,
                                            //width: 120,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => spinKit,
                                            errorWidget: (context, url, error) => Image.asset("assets/images/johukuminfologo.png",height: 80.0,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => RatingBar.builder(
                                    initialRating: businessProfileController.ratingValue.value,
                                    minRating: 1,
                                    itemSize: 30.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Text(
                                  " (${obj.aggregateRating.toStringAsFixed(1)})",
                                  style: textStyleUbuntu(color: kBlackColor, fontSize: 25, fontWeight: weight500),
                                )
                              ],
                            ),
                            size10,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "${controller.businessDataModel.value.llocation.businessName ?? ""}",
                                maxLines: 2,
                                style: textStyleUbuntu(color: kBlackColor, fontSize: 35.0, fontWeight: weightBold),
                              ),
                            ),
                            size10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Verified",
                                  style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(Icons.verified, color: Colors.amber),
                                Text(
                                  "Trusted",
                                  style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text("Reviews: ", style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500, fontSize: 20)),
                                Text("${obj.totalReviews}", style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500, fontSize: 20)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BusinessReview(
                                            reviews: obj.reviews,
                                            businesssID: widget.id,
                                            businessName: obj.llocation.businessName,
                                            slug: widget.slug,
                                          )),
                                    );
                                  },
                                  child: Text("See reviews", style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weightBold, textDecoration: TextDecoration.underline, fontSize: 20)),
                                ),
                              ],
                            ),
                            size20,
                            Row(
                              children: [
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 50,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Call Now",
                                    textColor: kWhiteColor,
                                    fontSize: 20.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: kPrimaryPurple,
                                    isIcon: true,
                                    callback: () {
                                      obj.contact.mobileNumbers.length == 0
                                          ? showSnackBar(
                                              context: context,
                                              message: "No "
                                                  "Contact Found")
                                          : callNumber(obj.contact.mobileNumbers[0].mobileNumber);
                                    },
                                    iconData: Icon(
                                      Icons.call,
                                      color: kWhiteColor,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 50,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Send Message",
                                    textColor: kBlackColor,
                                    fontSize: 20.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.amber,
                                    isIcon: true,
                                    iconData: Icon(
                                      Icons.message,
                                      color: kBlackColor,
                                      size: 18.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            size10,
                            Row(
                              children: [
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 50,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Map Location",
                                    textColor: kWhiteColor,
                                    fontSize: 20.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.red[600],
                                    isIcon: true,
                                    callback: () {
                                      MapsLauncher.launchCoordinates(obj.llocation.geo.coordinates[1], obj.llocation.geo.coordinates[0], obj.llocation.businessName);

                                      // MapUtils.openMap(23.6850, 90.3563);
                                      print("${obj.llocation.geo.coordinates[0]}");
                                    },
                                    iconData: Icon(
                                      Icons.location_on,
                                      color: kWhiteColor,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: WelcomeScreenButton(
                                    height: 50,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    buttonText: "Website",
                                    textColor: kWhiteColor,
                                    fontSize: 20.0,
                                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                                    buttonColor: Colors.black.withOpacity(0.7),
                                    isIcon: true,
                                    callback: () {
                                      obj.contact.website == null
                                          ? showSnackBar(context: context, message: "No Website Found")
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => WebViewExample(
                                                        url: obj.contact.website,
                                                      )),
                                            );
                                      // launchURL("https://www.google.com");
                                    },
                                    iconData: Icon(
                                      Icons.open_in_browser_rounded,
                                      color: kWhiteColor,
                                      size: 18.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            size20,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                obj.description ?? "No Description Found",
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: textStyleUbuntu(color: kBlackColor, fontWeight: weight400, fontSize: 18.0),
                              ),
                            ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Business Information",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 22.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: textUbuntu("Address", kBlackColor, fontSize: 20)),
                                  textUbuntu(": ", kBlackColor, fontSize: 20),
                                  Expanded(
                                      flex: 2,
                                      child: textUbuntu(
                                          "${obj.llocation.landMark??""} , ${obj.llocation.area??""}",
                                          kBlackColor,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: textUbuntu("Call", kBlackColor, fontSize: 20)),
                                  textUbuntu(": ", kBlackColor, fontSize: 20),
                                  obj.contact.mobileNumbers.length == 0
                                      ? Expanded(flex: 2, child: textUbuntu("No Contact Found", kBlackColor, fontSize: 20))
                                      : Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 20,
                                            //padding: EdgeInsets.only(bo),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: obj.contact.mobileNumbers.length,
                                              itemBuilder: (_, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                  child: textUbuntu("${obj.contact.mobileNumbers[index].mobileNumber}, ", kBlackColor, fontSize: 20),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: textUbuntu("Website", kBlackColor, fontSize: 20)),
                                  textUbuntu(": ", kBlackColor, fontSize: 20),
                                  Expanded(flex: 2, child: textUbuntu(obj.contact.website ?? "No website found", kBlackColor, fontSize: 20))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: size.height * 0.2,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Working hour",kBlackColor,fontSize: 20)),
                                              textUbuntu(": ", kBlackColor, fontSize: 20),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: size.height * 0.2,
                                      padding: EdgeInsets.only(left: 4.0, right: 20.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Saturdy",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.saturday.open24h == true
                                                  ? textUbuntu("- Open in 24 hours",kBlackColor,fontSize: 20)
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Sunday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.sunday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Monday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.monday.open24h == true
                                                  ? textUbuntu("- Open in 24 hours",kBlackColor,fontSize: 20)
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Tuesday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.tuesday.open24h == true
                                                  ? Text("- Open in 24 hours")
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Wednesday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.wednesday.open24h == true
                                                  ? textUbuntu("- Open in 24 hours",kBlackColor,fontSize: 20)
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Thursday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.thursday.open24h == true
                                                  ? textUbuntu("- Open in 24 hours",kBlackColor,fontSize: 20)
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                          size5,
                                          Row(
                                            children: [
                                              Expanded(flex: 1, child: textUbuntu("Friday",kBlackColor,fontSize: 20)),
                                              obj.hoursOfOperation.friday.close == true
                                                  ? textUbuntu("- Closed",kBlackColor,fontSize: 20)
                                                  : textUbuntu("-${obj.hoursOfOperation.saturday.openFrom.substring(0, 5)} am"
                                                      " to ${obj.hoursOfOperation.saturday.openTill.substring(0, 5)} "
                                                      "pm",kBlackColor,fontSize: 20),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            size5,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Payment Method",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 22.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size10,
                            obj.acceptedPaymentMethods.length == 0
                                ? Text("No payment methid found")
                                : Container(
                                    height: 35,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.acceptedPaymentMethods.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                          //height: 25,
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                                            obj.acceptedPaymentMethods[index].name,
                                            style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Photos",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 22.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size10,
                            obj.photos.length == 0
                                ? Text("No Photos Found")
                                : Container(
                                    height: size.height * 0.2,
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.photos.length,
                                      itemBuilder: (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${obj.photos[index].image}",
                                              height:size.height * 0.2,
                                              width:200,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => spinKit,
                                              errorWidget: (context, url, error) => Icon(
                                                Icons.error,
                                                color: kPrimaryPurple,
                                                size: 22,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Keywords",
                                    style: textStyleUbuntu(color: kBlackColor, fontSize: 22.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                                  ),
                                )),
                            size10,
                            obj.keywords.length == 0
                                ? Text("No keywords found")
                                : Container(
                                    height: 35,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: obj.keywords.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                          //height: 25,
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                                            obj.keywords[index].name,
                                            style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500),
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                            size20,
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 2.0,
                              height: 5,
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                            size20,
                            /*obj.reviews.length == 0
                                ? textUbuntu("No Reviews Found", kPrimaryPurple, fontWeight: weight500)
                                : ListView.builder(
                                    itemCount: obj.reviews.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              obj.reviews[index].addedBy,
                                              style: textStyleUbuntu(
                                                  color: kBlackColor, fontWeight: weight500, fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: obj.reviews[index].rating.toDouble(),
                                                  itemSize: 18.0,
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                textUbuntu(
                                                    "${DateFormat.yMMMMd('en_US').format(DateTime.parse(obj.reviews[index].reviewedAt))}",
                                                    kBlackColor.withOpacity(0.4))
                                              ],
                                            ),
                                            size10,
                                            Text(
                                              obj.reviews[index].comment,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: textStyleUbuntu(
                                                  color: kBlackColor, fontWeight: weight400, fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),*/
                            size10,
                          ],
                        ),
                      );
              })),
        ),
      ),
    );
  }
}

/*

size20,
Divider(
color: Colors.grey.withOpacity(0.3),
thickness: 2.0,
height: 5,
endIndent: 10.0,
indent: 10.0,
),
size20,
Text("Add your review:",
style: textStyleUbuntu(
color: kBlackColor,
fontWeight: weight500,
fontSize: 16.0,
textDecoration: TextDecoration.underline)),
size5,
RatingBar.builder(
initialRating: 0.0,
minRating: 0,
itemSize: 27.0,
direction: Axis.horizontal,
allowHalfRating: true,
itemCount: 5,
//itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
itemBuilder: (context, _) => Icon(
Icons.star,
color: Colors.amber,
),
onRatingUpdate: (rating) {
ratingValue = rating.toString();
print("User rating: " + ratingValue);
},
),
size10,
Container(
height: 70.0,
margin: EdgeInsets.symmetric(horizontal: 10.0),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(5.0), color: Colors.grey.withOpacity(0.3)),
child: TextFormField(
maxLines: 4,
controller: ratingController,
decoration: InputDecoration(
border: InputBorder.none,
contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
hintText: 'Write your review',
),
onChanged: (str) => print('Multi-line text change: $str'),
),
),
size20,
WelcomeScreenButton(
edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 70.0),
buttonColor: kPrimaryPurple,
buttonText: "Submit",
textColor: kWhiteColor,
fontSize: 16,
isIcon: false,
height: 40.0,
callback: () {
print(boxStorage.read(KEY_USER_ID));
print(boxStorage.read(KEY_USER_NAME));

boxStorage.read(KEY_TOKEN) == null
? openAddAuthDialog(context)
    : businessProfileController
    .postUserReview(widget.id, boxStorage.read(KEY_USER_ID),
boxStorage.read(KEY_USER_NAME), ratingValue, ratingController.text, context)
    .then((value) => ratingController.clear());
},
),*/
