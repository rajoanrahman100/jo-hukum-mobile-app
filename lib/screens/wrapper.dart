import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/packageInfoController.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreen.dart';
import 'package:get/get.dart';

import 'home/homeScreen.dart';

class WrapperClass extends StatefulWidget {
  @override
  _WrapperClassState createState() => _WrapperClassState();
}

class _WrapperClassState extends State<WrapperClass> {

  var packageController=Get.put(PackageInfoController());

  @override
  Widget build(BuildContext context) {

    return boxStorage.read(KEY_TOKEN)==null?WelcomeScreen():HomeScreen();
  }

}


class MyAppTwo extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppTwo> {
  double padValue = 0;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selectable ListView Example"),
        ),
        body: ListView(
          children: List.generate(paints.length, (index) {
            return ListTile(
              onTap: () {
                setState(() {
                  paints[index].selected = !paints[index].selected;

                  log(paints[index].selected.toString());
                });
              },
              selected: paints[index].selected,
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: paints[index].colorpicture,
                  ),
                ),
              ),
              title: Text('ID: ' + paints[index].id.toString()),
              subtitle: Text(paints[index].title),
              trailing: (paints[index].selected)
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
            );
          }),
        ),
      ),
    );
  }
}

class Paint {
  final int id;
  final String title;
  final Color colorpicture;
   bool selected;

  Paint(this.id, this.title, this.colorpicture,this.selected);



}

List<Paint> paints = <Paint>[
  Paint(1, 'Red', Colors.red,true),
  Paint(2, 'Blue', Colors.blue,true),
  Paint(3, 'Green', Colors.green,true),
  Paint(4, 'Lime', Colors.lime,true),
  Paint(5, 'Indigo', Colors.indigo,true),
  Paint(6, 'Yellow', Colors.yellow,false)
];