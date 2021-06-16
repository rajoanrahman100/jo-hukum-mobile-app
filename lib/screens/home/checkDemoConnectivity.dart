import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/connectivityController.dart';

class DemoConnect extends StatefulWidget {

  @override
  _DemoConnectState createState() => _DemoConnectState();
}

class _DemoConnectState extends State<DemoConnect> {
  var connect = Get.put(ConnectivityController());

  @override
  void initState() {
    // TODO: implement initState
    connect.startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(()=>connect.isOnline.value==true?Center(child: Text("ONLINE")):Center(child: Text("OFFLINE"))),
      /*body: GetX<ConnectivityController>(
        builder: (controller) {
          if (controller.isOnline.value != null) {
            return controller.isOnline.value
                ? Center(
                    child: Text(
                      "Home Page",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                : Center(child: Text("NO INTERNET"));
          }
          return spinKit;
        },
      ),*/
    );
  }
}
