import 'package:get/get.dart';
import 'package:johukum/modelClass/categoryClass.dart';
import 'package:johukum/screens/home/fetch_api.dart';

class CategoryController extends GetxController{
  var categoryDataClass = CategoryClass().obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory(categoryDataClass);
  }
}