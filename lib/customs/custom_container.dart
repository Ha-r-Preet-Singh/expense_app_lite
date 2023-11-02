import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  double? cHeight;
  double? cWidth;
  BorderRadius? cRadius;
  Color? borderSideColor;
  double? borderSideWidth;
  Color? cColor;
  Widget? mChild;
  DecorationImage? nImage;
  VoidCallback? onTap;


  CustomContainer({
    this.onTap,
    super.key,
    this.cHeight,
    this.cWidth,
    this.cRadius,
    this.cColor,
     this.mChild,
   this.borderSideColor,
    this.borderSideWidth,
    this.nImage,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(

        height: cHeight,
        width: cWidth,
        child: mChild,
        decoration: BoxDecoration(




          borderRadius: cRadius,
          border:
         Border.all(color:borderSideColor!,width: borderSideWidth!),
          color: cColor,
        ),
      ),
    );
  }
}
