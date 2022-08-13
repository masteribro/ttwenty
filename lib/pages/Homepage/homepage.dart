import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/pages/Homepage/tabView/TabView3.dart';
import 'package:ttwenty/pages/Homepage/tabView/Tabview1.dart';
import 'package:ttwenty/pages/Homepage/tabView/Tabview2.dart';

import '../../widget/Textview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
int intValue = 0;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    var orientation = MediaQuery.of(context).orientation;
    // getting the size of the window
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(36.h),
          child: SingleChildScrollView(
            child: Container(
              color: AppColor.black,
              child: SafeArea(
                child: Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Account',
                              style: TextStyle(color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              'Hello, Umar',
                              style: TextStyle(color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp
                              ),
                            ),
                          ],
                        ),


                        CircleAvatar(
                          radius: 30,
                          child: intValue == 0
                              ? CachedNetworkImage(
                            imageUrl: "",
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const CircularProgressIndicator(),
                          )
                              : CachedNetworkImage(
                            imageUrl: '',
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),

                      Text(
                        '\$17,000.00 ',
                        style: TextStyle(color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        child: Center(
                          child: Text('3.21%', style: TextStyle(color: Colors.white),),
                        ),
                        decoration: BoxDecoration(
                              color: AppColor.lightBlack,
                            borderRadius: BorderRadius.circular(9)
                        ),

                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),

                      SizedBox(
                        height: 5.h,
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        indicatorColor: AppColor.black,
                        unselectedLabelColor: AppColor.black,
                        labelColor: AppColor.black,
                        padding: EdgeInsets.only(left: 40.w, ),
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.only(left: 1.w, right: 1.w),
                        onTap: (int) {
                          setState(() {
                            intValue = int;
                          });
                        },
                        tabs: [
                          Tab(

                                child: Container(
                                    height: 3.h,
                                    width: 3.w,
                                    decoration: BoxDecoration(
                                        color: intValue == 0
                                            ? AppColor.lightBlack2
                                            : AppColor.white,
                                      shape: BoxShape.circle,),
                                 ),
                              ),
                          Tab(

                                child: Container(
                                    height: 3.h,
                                    width: 3.w,
                                    decoration: BoxDecoration(
                                        color: intValue == 1
                                            ? AppColor.lightBlack2
                                            : AppColor.white,
                                      shape: BoxShape.circle,),
                                 ),
                              ),
                          Tab(

                                child: Container(
                                    height: 3.h,
                                    width: 3.w,
                                    decoration: BoxDecoration(
                                        color: intValue == 2
                                            ? AppColor.lightBlack2
                                            : AppColor.white,
                                      shape: BoxShape.circle,),
                                 ),
                              ),

                        ],
                      ),

                    ],
                  ),
                  
                )
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TabView1(),
            TabView2(),
            TabView3(),
          ],
        ),
      ),
    );



  }
}
