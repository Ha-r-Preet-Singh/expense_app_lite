import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  String hintTxt;
  IconData? suffIcon;
  TextEditingController? TextEditContoller;
  String? Function(String?) validate;


   CustomTextField({
   required this.hintTxt,
     this.suffIcon,
     required this.validate,
     this.TextEditContoller,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditContoller,
      decoration: InputDecoration(

        filled: true,
        fillColor: AppColors.textfieldColor,
        hintText: hintTxt,


        suffixIcon:Icon(suffIcon),
        suffixIconColor:AppColors.hintextColor ,
        hintStyle: mTextStyle15(
          fFamily: "poppinsbold",
          mColor: AppColors.hintextColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color:AppColors.textfieldColor ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:AppColors.textfieldColor ),
        ),

      ),
        validator: validate,
    );
  }
}
