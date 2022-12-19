import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionType extends StatelessWidget {
  TransactionType({Key? key,  required this.type, this.color }) : super(key: key);
  String type;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 30.w,
      decoration:  BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3.h)
      ),

      child:  Center(child: Text(type, style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),)),
    );
  }
}
