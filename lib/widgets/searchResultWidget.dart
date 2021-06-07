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
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Container(
          height: height ?? size.height / 6,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          decoration: BoxDecoration(
              //color: kWhiteColor,
              borderRadius: BorderRadius.circular(10.0)),
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
                        height: imageHeight ?? 80,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => spinKit,
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: kPrimaryPurple,
                          size: 22,
                        ),
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
                                child: textUbuntu("$distance km", kWhiteColor, fontWeight: weight500, fontSize: distanceFontSize ?? 14),
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
                                  child: textUbuntu("$street", kPrimaryPurple, fontWeight: weight500, maxLine: 1, fontSize: addressFontSize ?? 14),
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
