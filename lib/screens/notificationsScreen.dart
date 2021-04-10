import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatelessWidget {


  List notifications=[
    "Rent is available st 'Shanta Housing' near your area.",
    "Review 'Softopark' you have visited today.",
    "Congratulations, your business has 100 review now.",
    "Upto 60% dicosunt on any pasta platter at 'Pasta Club' with a free drink.",
    "Buy 1 Get 2 campaignis is running at 'Shwarma House'. Offer will be available till Baisakh",
    "Visit 'Khacchi.com'. They served best khacchi in your area",
  ];

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kWhiteColor),
        title: Text("Notifications",style: textStyleUbuntu(color: kWhiteColor),),
      ),
      body: Container(
        height: size.height,
        margin: EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (_,index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: textStyleUbuntu(color: kBlackColor, fontWeight: weight500,fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    "${timeago.format(DateTime.parse(DateTime.now().toString()))}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kBlackColor.withOpacity(0.4),fontWeight: weight400,fontSize: 16),

                  ),
                  Divider(color: kBlackColor.withOpacity(0.4),)
              ],
              ),
            );
          },
        ),
      ),
    );
  }
}
