


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/main.dart';
import 'package:ttwenty/widget/Textview.dart';

import '../../../Controller/home_controller.dart';
import '../coin_container.dart';

class TabView1 extends StatefulWidget {
  const TabView1({Key? key}) : super(key: key);

  @override
  State createState()  => _TabView1State();
}

class _TabView1State extends StateMVC<TabView1> {
  _TabView1State () : super(HomeController()) {
    con = controller as HomeController;
  }
  late HomeController con;
  @override
  void initState() {
    super.initState();

    }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    con.model.height = size.height;
    con.model.width = size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Container(
        padding: EdgeInsets.only(left: 7.w, right: 7.w,top: 3.h, bottom: 3.h),
        height: con.model.height,
        width: con.model.width,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView (text: 'My Assets $dynamicPath',
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23.sp,
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      con.model.newContainer = CoinContainer( color: AppColor.secondary, amount: con.model.amount1, id: con.model.id );
                      con.model.listOfCoins.add(con.model.newContainer!);
                      // con.model.id++;
                      print(con.model.listOfCoins);
                    });

                  },

                    child: const Icon(Icons.add))
              ],),


            SizedBox(
              height: 1.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: con.model.listOfCoins.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: con.model.listOfCoins[index],
                  );
                })
            //
          ],
        ),
      )
    );
  }
  
}


