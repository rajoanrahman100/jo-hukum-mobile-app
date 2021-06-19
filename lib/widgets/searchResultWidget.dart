import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class SearchItemWidget extends StatelessWidget {
  var image;
  var businessName;
  var distance;
  var street;
  Size size;
  var height;
  var imageHeight;
  var titleFontSize;
  var distanceFontSize;
  var addressFontSize;
  var addressConHeight;
  var addressConWidth;
  Function callBack;

  SearchItemWidget(
      {this.image,
      this.businessName,
      this.distance,
      this.street,
      this.size,
      this.height,
      this.imageHeight,
      this.titleFontSize,
      this.distanceFontSize,
      this.addressFontSize,
      this.addressConHeight,
      this.addressConWidth,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: height ?? size.height /6.3,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
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
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      height: imageHeight ?? 90,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => spinKit,
                      errorWidget: (context, url, error) => Image.asset("assets/images/johukuminfologo.png",height: 80.0,),
                    ),
                  ),
                ),
                width10,
                Expanded(
                    flex: 2,
                    child: Container(
                      //height: 70,
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textUbuntu(businessName, kBlackColor, fontWeight: weight500, maxLine: 2, fontSize: titleFontSize ?? 16),
                          size5,
                          Container(
                            height: addressConHeight??25,
                            width:addressConWidth?? 55,
                            decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: textUbuntu("$distance km", kWhiteColor, fontWeight: weight500, fontSize:
                              distanceFontSize ?? 13),
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
                                child: textUbuntu("$street", kPrimaryPurple, fontWeight: weight500, maxLine: 2,
                                    fontSize: addressFontSize ?? 13.0),
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
    );
  }
}
