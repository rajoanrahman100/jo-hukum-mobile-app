import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class HomeDashBoardBusiness extends StatelessWidget {

  var txt="Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";

  var backImage =
      "https://i1.wp.com/www.finddoctor24.com/wp-content/uploads/2019/03/Islami-Bank-Hospital-Mugda.jpg?fit=471%2C286&ssl=1";

  var description =
      "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc. Me sumo unique argument um no. Ea alien um accustoms quo,mod summon effendi it tied.";

  var profile ="https://dsxzwbyxhnf79.cloudfront.net/productGalleries/2021/04/60753028bf116_1618292776.jpg";

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profile)),
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
                    textUbuntu("Softopark IT Limited", kBlackColor,fontWeight: weight500),
                    size5,
                    RatingBar.builder(
                      initialRating: 5.0,
                      minRating: 1,
                      itemSize: 16.0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    size5,
                    textUbuntu("Twin Tower, Bloack C, Main Road", kBlackColor),
                    size5,
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
                  Expanded(child: Divider(color: kPrimaryPurple,height: 2,))
                ],
              ),
              size10,
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: size.height/18,
                      decoration: BoxDecoration(
                          color: kPrimaryPurple,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUbuntu("150 Review ", kWhiteColor,fontWeight: weight500,fontSize: 16),
                          RatingBar.builder(
                            initialRating: 5.0,
                            minRating: 1,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      height: size.height/18,
                      decoration: BoxDecoration(
                          color: kPrimaryPurple,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUbuntu("Overall 75 CTA click", kWhiteColor,fontWeight: weight500,fontSize: 16),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
              size10,
              Row(
                children: [
                  textUbuntu("My Reviews", kPrimaryPurple),
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
                    color: Colors.white,
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
                              textUbuntu("Ratul Rahman", kPrimaryPurple,fontWeight: weight500),
                              size5,
                              textUbuntu("5 minit ago", kPrimaryPurple.withOpacity(0.6)),
                            ],
                          ),
                          RatingBar.builder(
                            initialRating: 5.0,
                            minRating: 1,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: kPrimaryPurple,
                            ),

                          )

                        ],
                      ),
                      size10,
                      textUbuntu(txt, kPrimaryPurple.withOpacity(0.7),maxLine: 5)
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
              size10,
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
              size10,


            ],
          ),
        ),
      )
    );
  }
}
