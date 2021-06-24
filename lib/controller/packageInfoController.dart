import 'package:get/get.dart';
import 'package:johukum/components/config.dart';
import 'package:package_info/package_info.dart';

class PackageInfoController extends GetxController{

  var version="".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getPackageInfo();
  }

  getPackageInfo(){
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
       version.value = packageInfo.version;
       boxStorage.write(VERSION_NUMBER, packageInfo.version);
    });
  }
}