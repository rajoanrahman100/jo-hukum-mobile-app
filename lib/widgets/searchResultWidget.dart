import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class SearchItemWidget extends StatelessWidget {
  var image;
  var businessName;
  var distance;
  var street;
  Size size;
  Function callBack;

  SearchItemWidget(
      {this.image, this.businessName, this.distance, this.street, this.size,this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:callBack ,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: size.height * 0.15,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          decoration: BoxDecoration(
            //color: kWhiteColor,
              borderRadius: BorderRadius.circular(6.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 35.0,
                      height: 75.0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(image)),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        //height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUbuntu(businessName, kBlackColor,
                                fontWeight: weight500, maxLine: 2, fontSize: 17),
                            size5,
                            Container(
                              height: 25,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: kPrimaryPurple,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: textUbuntu("$distance km", kWhiteColor,
                                    fontWeight: weight500, fontSize: 14),
                              ),
                            ),
                            size10,
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: kPrimaryPurple,
                                  size: 16,
                                ),
                                Expanded(
                                  child: textUbuntu("$street", kPrimaryPurple,
                                      fontWeight: weight500,
                                      maxLine: 1,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
