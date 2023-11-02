import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';



class CustomText extends StatelessWidget {

  String fText;
  double? fSize;
  String? fFamily;
  FontWeight? fWeight;
  Color? fColor ;
  TextDecoration? underText;



  CustomText({super.key,
    required this.fText,
    this.fSize,
    this.fFamily,
    this.fWeight,
    this.fColor ,
    this.underText,



  });

  @override
  Widget build(BuildContext context) {
    return Text(
      fText,
      style: TextStyle(
        fontSize: fSize,
        fontFamily: fFamily,
        fontWeight: fWeight,
        color: fColor,

        decoration: underText,

        decorationColor: AppColors.hintextColor,



      ),

    );
  }
}
