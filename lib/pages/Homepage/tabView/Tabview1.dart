


import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/widget/Textview.dart';

class TabView1 extends StatefulWidget {
  const TabView1({Key? key}) : super(key: key);

  @override
  State<TabView1> createState() => _TabView1State();
}

class _TabView1State extends State<TabView1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 7.w, right: 7.w,top: 3.h, bottom: 3.h),
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: 'My Assets',
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.sp,
                  ),
                  Icon(Icons.add)
                ],),

              SizedBox(
                height: 1.h,
              ),

              Container(
                height: 14.h,
                width: width,
                decoration: const BoxDecoration(
                    color: AppColor.lightOrange,
                    borderRadius: BorderRadius.all(Radius.circular(20) )
                ),
                child: Align(child: Text(''),)
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 14.h,
                width: width,
                decoration: const BoxDecoration(
                    color: AppColor.lightMaroon,
                    borderRadius: BorderRadius.all(Radius.circular(20) )
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 14.h,
                width: width,
                decoration: const BoxDecoration(
                    color: AppColor.bluegrey,
                    borderRadius: BorderRadius.all(Radius.circular(20) )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
