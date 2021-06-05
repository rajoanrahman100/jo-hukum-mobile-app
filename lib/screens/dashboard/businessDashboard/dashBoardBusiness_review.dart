import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessReviewsController.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class ReviewDashBoardBusiness extends StatelessWidget {


  var ratingValue=4.0;
  var txt="Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";

  var ratingCountController=Get.put(BusinessRatingController());




  @override
  Widget build(BuildContext context) {

    ratingCountController.getRatingData("602ce10270050b2691a99bcc");

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/6,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textUbuntu("$ratingValue", kBlackColor,fontWeight: weight500,fontSize: 35),
                            RatingBar.builder(
                              initialRating: ratingValue,
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
                            ),
                            size5,
                            textUbuntu("( 30 review )", kBlackColor,fontWeight: weight400),

                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                textUbuntu("5*", kBlackColor,fontWeight: weight500),
                                width5,
                                Expanded(
                                  child: Container(
                                    height: 10,
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
                                  ),
                                ),
                                width5,
                                textUbuntu("15", kBlackColor),

                              ],
                            ),
                            size5,
                            Row(
                              children: [
                                textUbuntu("4*", kBlackColor,fontWeight: weight500),
                                width5,
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 10,
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
                                      ),
                                      Container(
                                        height: 10,
                                        width: MediaQuery.of(context).size.width/2.5,
                                        decoration: BoxDecoration(
                                            color: kPrimaryPurple,

                                            borderRadius: BorderRadius.circular(10.0)
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                width5,
                                textUbuntu("15", kBlackColor),

                              ],
                            ),
                            size5,
                            Row(
                              children: [
                                textUbuntu("3*", kBlackColor,fontWeight: weight500),
                                width5,
                                Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 10,
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
                                        ),
                                        Container(
                                          height: 10,
                                          width: MediaQuery.of(context).size.width/3.5,
                                          decoration: BoxDecoration(
                                              color: kPrimaryPurple,

                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                width5,
                                textUbuntu("15", kBlackColor),

                              ],
                            ),
                            size5,
                            Row(
                              children: [
                                textUbuntu("2*", kBlackColor,fontWeight: weight500),
                                width5,
                                Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 10,
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
                                        ),
                                        Container(
                                          height: 10,
                                          width: MediaQuery.of(context).size.width/6,
                                          decoration: BoxDecoration(
                                              color: kPrimaryPurple,

                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                width5,
                                textUbuntu("15", kBlackColor),

                              ],
                            ),
                            size5,
                            Row(
                              children: [
                                textUbuntu("1*", kBlackColor,fontWeight: weight500),
                                width5,
                                Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 10,
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
                                        ),
                                        Container(
                                          height: 10,
                                          width: MediaQuery.of(context).size.width/12,
                                          decoration: BoxDecoration(
                                              color: kPrimaryPurple,

                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                width5,
                                textUbuntu("15", kBlackColor),

                              ],
                            )
                          ],
                        ),
                      ),

                    )
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}