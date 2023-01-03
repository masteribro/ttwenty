import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionBox extends StatelessWidget {
  TransactionBox({Key? key, required this.icon}) : super(key: key);
IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 25.w,
      decoration:  BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(3.h)
      ),

      child:  Icon(icon),
    );
  }
}
