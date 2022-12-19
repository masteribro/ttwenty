import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionBox extends StatelessWidget {
  const TransactionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 25.w,
      decoration:  BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(3.h)
      ),

      child: const Icon(Icons.money_outlined),
    );
  }
}
