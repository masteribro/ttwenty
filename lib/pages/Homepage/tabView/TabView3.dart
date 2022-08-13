import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/color.dart';

class TabView3 extends StatefulWidget {
  const TabView3({Key? key}) : super(key: key);

  @override
  State<TabView3> createState() => _TabView3State();
}

class _TabView3State extends State<TabView3> {
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
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
          ),
        )
    );
  }
}
