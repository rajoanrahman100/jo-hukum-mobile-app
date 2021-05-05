import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/textWidgets.dart';

class DivisionDialog extends StatelessWidget {


  var divisionController = Get.put(DivisionController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          elevation: 0.0,
          title: Text("Select a divison",
              style: textStyleUbuntu(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w500),
            ),

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive(
                  mobile: Obx(()=>Container(
                    height: size.height,
                    child: divisionController.divisionModelClass.value == null
                        ? textUbuntu("loading...", kPrimaryPurple)
                        : divisionController.divisionModelClass.value.results.length == 0
                        ? textUbuntu("No data found", kPrimaryPurple)
                        : ListView.builder(
                      itemCount: divisionController.divisionModelClass.value.results.length,
                      itemBuilder: (_,index){
                        return GestureDetector(
                          onTap: (){
                            divisionController.setDivisionID(divisionController.divisionModelClass
                                .value.results[index].sId);
                            divisionController.setDivision(divisionController.divisionModelClass
                                .value.results[index].name);
                            Navigator.of(context).pop();
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: textUbuntu(
                                    divisionController
                                        .divisionModelClass.value.results[index].name,
                                    kPrimaryPurple,fontSize: 18,fontWeight: weight500),
                              ),
                              Divider(color: kPrimaryPurple,)
                            ],
                          ),
                        );
                      },
                    ),
                  ),)
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

void openDivisionDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return  DivisionDialog();
      },
      fullscreenDialog: true));
}
