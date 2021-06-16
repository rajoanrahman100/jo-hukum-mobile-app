import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController{
  Connectivity _connectivity = new Connectivity();

  var isOnline=false.obs;




  startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((
        ConnectivityResult result,
        ) async {
      if (result == ConnectivityResult.none) {
        isOnline.value= false;
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          isOnline.value= isConnected;
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        isOnline.value = false;
      } else {
        isOnline.value= true;

      }
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected;
    try {
      final List<InternetAddress> result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
      //return false;
    }
    return isConnected;
  }
}