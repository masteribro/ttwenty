import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body:
         SafeArea(

           child: Stack(
             children: [
               const Positioned(
                   top: 0,
                   child: Text(
                     'My Account',
                     style: TextStyle(color: AppColor.bgGrey1,
                         fontWeight: FontWeight.bold,
                         fontSize: 30
                     ),
                   )),
               const Positioned(
                   top: 45,
                   child: Text(
                     'Hello, Umar',
                     style: TextStyle(color: AppColor.bgGrey1,
                         fontWeight: FontWeight.bold,
                         fontSize: 15
                     ),
                   )),
               const Positioned(
                   top: 70,
                   child: Text(
                     '\$17,000.00 ',
                     style: TextStyle(color: AppColor.bgGrey1,
                         fontWeight: FontWeight.bold,
                         fontSize: 50
                     ),
                   )),
                Positioned(
                   bottom: 0,
                   child: Container(
                     color: AppColor.white,
                     height: 450,
                     width: 420,
                   ))

             ],

           ),
           )


    );
  }
}
