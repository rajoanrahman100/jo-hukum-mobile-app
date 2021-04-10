import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,this.callBack
  }) : super(key: key);

  final Size size;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      color: kPrimaryPurple,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: callBack,
                  child: Icon(
                    Icons.menu,
                    color: kWhiteColor,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Location",
                        style: textStyleUbuntu(
                            color: kWhiteColor.withOpacity(0.4),
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "28/3 Golapbag,Dhaka-1100",
                        style: textStyleUbuntu(
                            color: kWhiteColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, '/notification'),
                child: Icon(
                  Icons.notifications,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 60.0,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: kWhiteColor.withOpacity(0.3)),
            child: Container(
              height: 50.0,
              width: size.width,
              margin: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: kPrimaryPurple),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search anything you want',
                        hintStyle: TextStyle(fontSize: 16),
                        prefixIcon: Icon(
                          Icons.dashboard,
                          color: kPrimaryPurple,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: kWhiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: kWhiteColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
