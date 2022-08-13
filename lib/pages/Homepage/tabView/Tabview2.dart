import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/color.dart';

class TabView2 extends StatefulWidget {
  const TabView2({Key? key}) : super(key: key);

  @override
  State<TabView2> createState() => _TabView2State();
}

class _TabView2State extends State<TabView2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
          ),
        )
    );
  }
}
