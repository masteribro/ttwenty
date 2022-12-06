


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  void initState() {
    super.initState();

      setState(() {
        globalI++;
        Navigator.pop(context);
      });
    }

  int hassan = 0;
  int globalI=0;


  showModel(context) {

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColor.grey1,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: 8.w,
                      top: 1.w,
                      right: 8.w,
                      bottom: 7.w
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 0.4.h,
                          width: 27.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 2.5.h,),

                        Align(
                          alignment: Alignment.topLeft,

                          child: Text('Choose your coin',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp
                            ),),

                        ),
                        SizedBox(height: 3.5.h,),
                        Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  globalI++;
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bitcoin',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp
                                    ),),
                                  Container(
                                    height: 3.5.h,
                                    width: 23.w,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(top: 4, left: 5),
                                            height: 3.5.h,
                                            width: 7.w,
                                            child: Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: Text('$hassan',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )),
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 2),
                                          height: 3.5.h,
                                          width: 5.w,
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                hassan++;
                                              });
                                            },
                                            child: Icon(Icons.add,
                                              color: AppColor.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 1,),
                                        Container(
                                          height: 3.5.h,
                                          width: 5.w,
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                hassan--;
                                              });
                                            },
                                            child: Text('-',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            )

                                            ),
                                          ),


                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.rectangle
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 1.h,),
                        Divider(thickness: 0.3.h,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 1.h,),
                        Align(
                            alignment: Alignment.topLeft,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('USDT',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                Container(
                                  height: 3.5.h,
                                  width: 23.w,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(top: 4, left: 5),
                                          height: 3.5.h,
                                          width: 7.w,
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text('$hassan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(bottom: 2),
                                        height: 3.5.h,
                                        width: 5.w,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              hassan++;
                                            });
                                          },
                                          child: Icon(Icons.add,
                                            color: AppColor.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1,),
                                      Container(
                                        height: 3.5.h,
                                        width: 5.w,
                                        child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                hassan--;
                                              });
                                            },
                                            child: Text('-',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            )

                                        ),
                                      ),


                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.rectangle
                                  ),
                                )
                              ],
                            )
                        ),
                        SizedBox(height: 1.h,),
                        Divider(thickness: 0.3.h,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 1.h,),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('BUSD',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                Container(
                                  height: 3.5.h,
                                  width: 23.w,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(top: 4, left: 5),
                                          height: 3.5.h,
                                          width: 7.w,
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text('$hassan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(bottom: 2),
                                        height: 3.5.h,
                                        width: 5.w,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              hassan++;
                                            });
                                          },
                                          child: Icon(Icons.add,
                                            color: AppColor.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1,),
                                      Container(
                                        height: 3.5.h,
                                        width: 5.w,
                                        child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                hassan--;
                                              });
                                            },
                                            child: Text('-',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            )

                                        ),
                                      ),


                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.rectangle
                                  ),
                                )
                              ],
                            )
                        ),
                        SizedBox(height: 1.h,),
                        Divider(thickness: 0.3.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ));
            },

          );
        });

  }
  List<int> master =[];



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
            mainAxisSize: MainAxisSize.max,
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
                  InkWell(
                    onTap: ()=>showModel(context) ,
                      child: Icon(Icons.add))
                ],),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: globalI,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 14.h,
                        width: width,
                        child: ListTile(
                          title: Text('Bitcoin'),
                          subtitle: Text('30'),
                        ),
                        decoration: const BoxDecoration(
                            color: AppColor.lightOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20) )
                        ),
                      ),
                    );
                  },


                ),
              ),
              //
            ],
          ),
        ),
      )
    );
  }
}
