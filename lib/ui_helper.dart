import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final Color whiteColor = Color(0xffffffff);
  static final Color begniColor = Color(0xff5f4c78);
  static final Color textfieldColor = Color(0xff74608a);
  static final Color hintextColor = Color(0xffc1b9cb);
  static final Color buttonColor = Color(0xff7c23c1);
  static final Color splashColor = Color(0xfff1f4f7);
  static final Color onboardingColor = Color(0xff1e0144);
}

Widget hSpacer({mHeight = 11.0}) {
  return SizedBox(
    height: mHeight,
  );
}

Widget wSpacer({mWidth=11.0}) {
  return SizedBox(
    width: mWidth,
  );
}


TextStyle mTextStyle50({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 50,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}


TextStyle mTextStyle40({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 40,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}




TextStyle mTextStyle30({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 30,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}





TextStyle mTextStyle20({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 20,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}



TextStyle mTextStyle15({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 15,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}


TextStyle mTextStyle12({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 12,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}


TextStyle mTextStyle10({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 10,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}



TextStyle mTextStyle5({
  Color mColor = Colors.white,
  FontWeight fWeight = FontWeight.normal,
  String fFamily = "poppins",
}){
  return TextStyle(
    fontSize: 5,
    fontWeight: fWeight,
    fontFamily:fFamily,
    color: mColor,
  );

}
