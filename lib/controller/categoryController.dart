import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/modelClass/categoryClass.dart';
import 'package:johukum/widgets/customToast.dart';

class CategoryController extends GetxController{

  var categoryDataClass = CategoryClass().obs;
  var resultDataClass = List<Results2>().obs;
  var subCategoryDataClass = List<Sub_categories>().obs;

  ///New Functio

  //RxList<Results2> result=[].obs;


  var pageNumber=1.obs;

  increasePageNumber(){
    pageNumber.value++;
  }

  @override
  void onInit() {
    super.onInit();
    getTask(pageNumber.value);
    //fetchCategoryItems(pageNumber.value);
  }

  Future<void> getTask(page)async{

     var post=await fetchCategoryItems(page);
     resultDataClass.addAll(post);
     print(resultDataClass.length);

  }

  Future<List<Results2>> fetchCategoryItems(pageNumber) async {
    // make GET request
    var response = await get(Uri.parse(categoryApi+"?"+"page=$pageNumber"));

    print("ResponsefetchCategory = " + response.body);


    try{
      if (response.statusCode == 200 || response.statusCode == 201) {

        var dataMap = jsonDecode(response.body);

        CategoryClass homeProductDataClass = CategoryClass.fromJson(dataMap);

        return homeProductDataClass.results;
        //categoryDataClass.value = homeProductDataClass;
        //setResultsData(homeProductDataClass.results);

      } else {
        throw ("Error code " + response.statusCode.toString());
      }
    }catch(e){
      Get.snackbar('${e.toString()}!', 'Server is currently unavailable',
          snackPosition: SnackPosition.TOP,
          backgroundColor: kWhiteColor);
    }


  }

//  fetchCategory(categoryDataClass,pageNumber);

}