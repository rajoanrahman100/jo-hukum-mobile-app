import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';

class LocationController extends GetxController{

  var currentAddress="No address found".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getTimeZoneInfo();
  }

  getTimeZoneInfo() async {

    print("calling coordinates");

     await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then((value){
      return getAddressFromLatLng(value);
    });

  }

  Future<Position> getAddressFromLatLng(position) async {
    try {

      print("lat ${position.latitude} and long ${position.longitude}");

      boxStorage.write(LAT, position.latitude.toString());
      boxStorage.write(LONG, position.longitude.toString());

      //SharedConfig.pref.setString("lat", position.latitude.toString());
      //SharedConfig.pref.setString("long", position.longitude.toString());


      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      var _currentAddress = "${place.locality}, ${place.street}, ${place.country}";
      currentAddress.value=_currentAddress;
      SharedConfig.pref.setString("address", _currentAddress);

      print("address $_currentAddress");
    } catch (e) {
      print(e);
    }
  }

}