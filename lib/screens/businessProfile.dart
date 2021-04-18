import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class BusinessProfile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var backImage =
      "https://i1.wp.com/www.finddoctor24.com/wp-content/uploads/2019/03/Islami-Bank-Hospital-Mugda.jpg?fit=471%2C286&ssl=1";

  var description =
      "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc. Me sumo unique argument um no. Ea alien um accustoms quo,mod summon effendi it tied.";

  var profile =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/158261324_226608225830377_8521737132345272932_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=PivMlip5C94AX8C38PS&_nc_ht=scontent.fdac116-1.fna&oh=ece9ef74fbfee93d213a6c1e8437438d&oe=60967998";

  var profile2=
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/s960x960/172139378_246438640514002_2991380741640275172_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=8vxsgEpGYdkAX-DthXH&_nc_ht=scontent.fdac116-1.fna&tp=7&oh=e24c1c1e7f00c34adc466425d21997fa&oe=60991120";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          title: Text(
            "Profile",
            style: textStyleUbuntu(color: kWhiteColor),
          ),
          iconTheme: IconThemeData(color: kWhiteColor),
        ),
        body: Responsive(
          mobile: Container(
            height: size.height,
            child: SingleChildScrollView(
              child: Column(

                children: [
                  Container(
                    height: size.height * 0.3,
                    width: size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          backImage,
                          height: size.height * 0.2,
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 35.0),
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurple),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(backImage)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(60.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
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
                          print(rating);
                        },
                      ),
                      Text(
                        " (${3.5})",
                        style: textStyleUbuntu(
                            color: kBlackColor,
                            fontSize: 16,
                            fontWeight: weight500),
                      )
                    ],
                  ),
                  size20,
                  Text(
                    "Islami Bank Hospital, Mugda",
                    style: textStyleUbuntu(
                        color: kBlackColor,
                        fontSize: 20.0,
                        fontWeight: weightBold),
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
                        style: textStyleUbuntu(
                            color: kBlackColor, fontWeight: weight500),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(Icons.verified, color: Colors.amber),
                      Text("Trusted",
                          style: textStyleUbuntu(
                              color: kBlackColor, fontWeight: weight500)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Views: ",
                          style: textStyleUbuntu(
                              color: kBlackColor, fontWeight: weight500)),
                      Text("512",
                          style: textStyleUbuntu(
                              color: kBlackColor, fontWeight: weight500)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Reviews: ",
                          style: textStyleUbuntu(
                              color: kBlackColor, fontWeight: weight500)),
                      Text("20",
                          style: textStyleUbuntu(
                              color: kBlackColor, fontWeight: weight500)),
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
                          edgeInsetsGeometry:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          buttonColor: kPrimaryPurple,
                          isIcon: true,
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
                          edgeInsetsGeometry:
                              EdgeInsets.symmetric(horizontal: 10.0),
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
                          edgeInsetsGeometry:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          buttonColor: Colors.red[600],
                          isIcon: true,
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
                          edgeInsetsGeometry:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          buttonColor: Colors.black.withOpacity(0.7),
                          isIcon: true,
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
                      description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: textStyleUbuntu(
                          color: kBlackColor,
                          fontWeight: weight400,
                          fontSize: 16.0),
                    ),
                  ),

                  size20,

                  Divider(
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,

                  Text("Add your review:",
                      style: textStyleUbuntu(
                          color: kBlackColor, fontWeight: weight500,fontSize: 16.0,textDecoration: TextDecoration.underline)),
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
                      print(rating);
                    },
                  ),
                  size10,

                  Container(
                    height: 70.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey.withOpacity(0.3)
                    ),
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
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
                  ),
                  size20,
                  Divider(
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,

                  Align(alignment: Alignment.topLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Business Information",style: textStyleUbuntu(color: kBlackColor,fontSize: 20.0,fontWeight: weight500,textDecoration: TextDecoration.underline),),
                  )),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Row(
                      children: [
                        Expanded(flex: 1,child: Text("Address")),
                        Text(": "),
                        Expanded(flex: 2,child: Text("Scretariate Road, Dhaka-1000,Bangladesh"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Row(
                      children: [
                        Expanded(flex: 1,child: Text("Call")),
                        Text(": "),
                        Expanded(flex: 2,child: Text("+8801521431798"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Row(
                      children: [
                        Expanded(flex: 1,child: Text("Website")),
                        Text(": "),
                        Expanded(flex: 2,child: Text("www.islamia.com"))
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: size.height*0.2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Working hour")),
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
                            height: size.height*0.2,
                            padding: EdgeInsets.only(left: 2.0,right: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Saturdy")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,
                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Sunday")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,

                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Monday")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,

                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Tuesday")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,

                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Wednesday")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,

                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Thursday")),
                                    Text("- Open in 24 hours"),
                                  ],
                                ),
                                size5,

                                Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("Friday")),
                                    Text("- Open in 24 hours"),
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
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,
                  Align(alignment: Alignment.topLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Services",style: textStyleUbuntu(color: kBlackColor,fontSize: 20.0,fontWeight: weight500,textDecoration: TextDecoration.underline),),
                  )),
                  size20,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Covid-19 test",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      ),
                      Expanded(
                        child: Container(

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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Online Dr. appoinment",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      )

                    ],
                  ),
                  size10,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("220 beds and words",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      ),
                      Expanded(
                        child: Container(

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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Diagnostic Center",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      )

                    ],
                  ),
                  size20,
                  Divider(
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,
                  Align(alignment: Alignment.topLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Facilities",style: textStyleUbuntu(color: kBlackColor,fontSize: 20.0,fontWeight: weight500,textDecoration: TextDecoration.underline),),
                  )),
                  size20,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Air conditions",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      ),
                      Expanded(
                        child: Container(

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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Car parking",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      )

                    ],
                  ),
                  size10,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Children play ground",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      ),
                      Expanded(
                        child: Container(

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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("24 hr service",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      )

                    ],
                  ),
                  size20,
                  Divider(
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,
                  Align(alignment: Alignment.topLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Payment Method",style: textStyleUbuntu(color: kBlackColor,fontSize: 20.0,fontWeight: weight500,textDecoration: TextDecoration.underline),),
                  )),
                  size20,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Cash",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      ),
                      Expanded(
                        child: Container(

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
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text("Credit/Debit Card",style: textStyleUbuntu(color: kPrimaryPurple,fontWeight: weight500),)),
                        ),
                      )

                    ],
                  ),
                  size20,
                  Divider(
                    color: Colors.grey.withOpacity(0.3),thickness: 2.0,height: 5,endIndent: 10.0,indent: 10.0,
                  ),
                  size20,
                  Align(alignment: Alignment.topLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Visitor Review",style: textStyleUbuntu(color: kBlackColor,fontSize: 20.0,fontWeight: weight500,textDecoration: TextDecoration.underline),),
                  )),
                  size20,
                  Container(
                    width: size.width,
                    height: size.height/5,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: kWhiteColor),
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(profile)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Md. Rejoan Rahman Rifat",style: textStyleUbuntu(
                                    color: kBlackColor,fontWeight: weight500,fontSize: 18
                                  ),),
                                  size5,
                                  Text("100 reviews",style: textStyleUbuntu(
                                      color: kBlackColor,fontWeight: weight400
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                        size5,
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.0,
                              minRating: 1,
                              itemSize: 18.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(width: 15,),
                            Text("11 month ago",style: textStyleUbuntu(
                                color: kBlackColor.withOpacity(0.4),fontWeight: weight400
                            ))
                          ],
                        ),
                        size10,
                        Text(
                          description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: textStyleUbuntu(
                              color: kBlackColor,
                              fontWeight: weight400,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  size10,
                  Container(
                    width: size.width,
                    height: size.height/5,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: kWhiteColor),
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(profile2)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Toufiq Islam",style: textStyleUbuntu(
                                      color: kBlackColor,fontWeight: weight500,fontSize: 18
                                  ),),
                                  size5,
                                  Text("10 reviews",style: textStyleUbuntu(
                                      color: kBlackColor,fontWeight: weight400
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                        size5,
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3.5,
                              minRating: 1,
                              itemSize: 18.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(width: 15,),
                            Text("11 month ago",style: textStyleUbuntu(
                                color: kBlackColor.withOpacity(0.4),fontWeight: weight400
                            ))
                          ],
                        ),
                        size10,
                        Text(
                          description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: textStyleUbuntu(
                              color: kBlackColor,
                              fontWeight: weight400,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
