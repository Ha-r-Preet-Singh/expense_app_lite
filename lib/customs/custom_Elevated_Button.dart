import 'package:flutter/material.dart';




class CustomElevatedButton extends StatelessWidget {

  VoidCallback onTap;
  Widget mChild;
  BorderRadius ButtonRadius;
  Color ButtonColor;
  double? ButtonElevation;
  // Color BorderSideColor;
  // double BorderSideWidth;

  CustomElevatedButton({
  required this.onTap,
    required this.mChild,
    required this.ButtonRadius,
    required this.ButtonColor,
    this.ButtonElevation,
    // this.BorderSideColor,
    // this.BorderSideWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: ButtonElevation,
        backgroundColor: ButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: ButtonRadius,
          side: BorderSide(

          ),

        ),
      ),
        onPressed: onTap,
        child: mChild,
    );
  }
}

