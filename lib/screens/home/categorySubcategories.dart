import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/modelClass/categoryClass.dart';
import 'package:johukum/widgets/textWidgets.dart';

class CategorySubcategories extends StatelessWidget {
  var sublist=List<Sub_categories>();
  var categoryName;
  var length;

  CategorySubcategories({this.sublist, this.categoryName,this.length});

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        title: Text(
          categoryName,
          style: textStyleUbuntu(color: kWhiteColor),
        ),
        iconTheme: IconThemeData(color: kWhiteColor),
      ),
      body: Container(
        height: size.height,
        child: sublist.length==0?Center(child: textUbuntu("No Data Found", kPrimaryPurple,fontWeight: weight500,fontSize: 20))
            :ListView.builder(
          itemCount: sublist.length,
          itemBuilder: (_,index){
            return Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kWhiteColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [

                    Container(
                      width: 80.0,
                      height: 55.0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage("https://dsqdpdmeibwm2.cloudfront"
                            ".net/${sublist[index].banner}")),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: textUbuntu(sublist[index].name, kPrimaryPurple,fontWeight: weight500))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
