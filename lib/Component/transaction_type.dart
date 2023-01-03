import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionType extends StatelessWidget {
  TransactionType({Key? key,  required this.type, this.color, this.textColor, this.width, this.height, this.borderRadius }) : super(key: key);
  String type;
  Color? color;
  Color? textColor;
  double? height;
  double? width;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 8.h,
      width: width ?? 30.w,
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.black45),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 3.h)
      ),

      child:  Center(child: Text(type, style:  TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor
      ),)),
    );
  }
}
