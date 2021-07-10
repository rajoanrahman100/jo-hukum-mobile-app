import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class CarasoulSlider extends StatefulWidget {

  var height;

  CarasoulSlider({this.height});

  @override
  _CarasoulSliderState createState() => _CarasoulSliderState();
}

class _CarasoulSliderState extends State<CarasoulSlider> {


  int _currentIndex=0;

  List cardList=[
    Item1(1),
    Item1(2),
    Item1(3),
    Item1(4),
    Item1(5),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: widget.height??140.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              //aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card){
              return Builder(
                  builder:(BuildContext context){
                    return Container(

                      //padding: EdgeInsets.symmetric(horizontal: 5.0),
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width,
                      child: card,
                    );
                  }
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(cardList, (index, url) {
              return Container(
                width: 5.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? kPrimaryPurple : Colors.grey[600],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
//this is push

class Item1 extends StatelessWidget {

  num value;

  Item1(this.value);

  @override
  Widget build(BuildContext context) {
    return value==1? Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/slide1.jpg"),
              fit: BoxFit.fill
          ),
      ),
    ):value==2?Container(decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/slide2.jpg"),
            fit: BoxFit.fill
        ),
    )):value==3?Container(decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/slide3.jpg"),
          fit: BoxFit.fill
      ),
    )):value==4?Container(decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/slide4.jpg"),
          fit: BoxFit.fill
      ),
    )):Container(decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/slide5.jpg"),
          fit: BoxFit.fill
      ),
    ));
  }
}