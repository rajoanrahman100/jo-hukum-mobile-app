import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PosterShow extends StatelessWidget {
  const PosterShow({
    Key key,
    @required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
   /* return Container(
      height: 130.0,
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          shrinkWrap: true,
          itemBuilder: (_,index){
            return Container(
              width: 150.0,
              height: 100.0,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(images[index],)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            );
          },
        ),
      ),
    );*/

  }
}
