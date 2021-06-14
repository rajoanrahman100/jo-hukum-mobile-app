import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/textWidgets.dart';

class MessageDashBoardBusiness extends StatelessWidget {

  var txt="Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";



  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(

      body: Responsive(
        mobile: Container(
            height: size.height,
            child: Center(
              child: textUbuntu("This feature will be available soon", kPrimaryPurple),
            )
        ),
        tablet: Container(
            height: size.height,
            child: Center(
              child: textUbuntu("This feature will be available soon", kPrimaryPurple,fontSize: 18.0),
            )
        ),
      )

    );
  }
}