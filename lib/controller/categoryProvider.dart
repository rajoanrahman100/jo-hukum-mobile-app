
import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';

class TaskProvider extends GetConnect {

  Future<List<dynamic>> getData(var page) async{
    final response=await get(categoryApi+"?"+"page=$page");

    if(response.status.hasError){
      return Future.error(response.statusText);
    }else{
      return response.body;
    }
  }
}
