import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constant/color.dart';

class Crypto extends StatefulWidget {
  const Crypto({Key? key}) : super(key: key);

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(

      body: Container(
        height: 10.h,
        width: width,
        decoration: const BoxDecoration(
            color: AppColor.bluegrey,
            borderRadius: BorderRadius.all(Radius.circular(20) )
        ),
      ),
    );
  }
}
