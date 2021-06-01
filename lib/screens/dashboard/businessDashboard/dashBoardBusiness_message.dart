import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class MessageDashBoardBusiness extends StatelessWidget {

  var txt="Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";



  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(

      body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                textUbuntu("Ratul Rahman", kBlackColor,fontWeight: weight500)
                              ],
                            ),
                            textUbuntu("5 minit ago", kBlackColor.withOpacity(0.6)),

                          ],
                        ),
                        size10,
                        textUbuntu(txt, kBlackColor,maxLine: 6,fontWeight: weight400),
                        size20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            textUbuntu("ratul@gmail.com", kBlackColor),

                          ],
                        )
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
                                textUbuntu("Ratul Rahman", kBlackColor,fontWeight: weight500)
                              ],
                            ),
                            textUbuntu("5 minit ago", kBlackColor.withOpacity(0.6)),

                          ],
                        ),
                        size10,
                        textUbuntu(txt, kBlackColor,maxLine: 6,fontWeight: weight400),
                        size20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            textUbuntu("ratul@gmail.com", kBlackColor),

                          ],
                        )
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
                                textUbuntu("Ratul Rahman", kBlackColor,fontWeight: weight500)
                              ],
                            ),
                            textUbuntu("5 minit ago", kBlackColor.withOpacity(0.6)),

                          ],
                        ),
                        size10,
                        textUbuntu(txt, kBlackColor,maxLine: 6,fontWeight: weight400),
                        size20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            textUbuntu("ratul@gmail.com", kBlackColor),

                          ],
                        )
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
                                textUbuntu("Ratul Rahman", kBlackColor,fontWeight: weight500)
                              ],
                            ),
                            textUbuntu("5 minit ago", kBlackColor.withOpacity(0.6)),

                          ],
                        ),
                        size10,
                        textUbuntu(txt, kBlackColor,maxLine: 6,fontWeight: weight400),
                        size20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            textUbuntu("ratul@gmail.com", kBlackColor),

                          ],
                        )
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
                                textUbuntu("Ratul Rahman", kBlackColor,fontWeight: weight500)
                              ],
                            ),
                            textUbuntu("5 minit ago", kBlackColor.withOpacity(0.6)),

                          ],
                        ),
                        size10,
                        textUbuntu(txt, kBlackColor,maxLine: 6,fontWeight: weight400),
                        size20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            textUbuntu("ratul@gmail.com", kBlackColor),

                          ],
                        )
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