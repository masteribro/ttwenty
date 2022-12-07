


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

    }
  List<Widget> listOfCoins =[];
  Widget? newContainer;
  int amount1 = 0;
  var width;
  var height;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Container(
        padding: EdgeInsets.only(left: 7.w, right: 7.w,top: 3.h, bottom: 3.h),
        height: height,
        width: width,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
        ),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
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
                  onTap: (){
                    setState((){
                      newContainer = CoinContainer(coin: 'Bitcoin', color: AppColor.secondary, amount: amount1,);
                      listOfCoins.add(newContainer!);
                      print(listOfCoins);
                      print(newContainer);
                    });
                  },

                    child: const Icon(Icons.add))
              ],),
            SizedBox(
              height: 1.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: listOfCoins.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: listOfCoins[index],
                  );
                })
            //
          ],
        ),
      )
    );
  }
  
}

class CoinContainer extends StatefulWidget {
  final String coin;
  final Color color;
  final int amount;
  const CoinContainer({Key? key, required this.coin, required this.color, required this.amount,}) : super(key: key);

  @override
  State<CoinContainer> createState() => _CoinContainerState();
}

class _CoinContainerState extends State<CoinContainer> {

  int stateAmount = 0;

  @override
  void initState() {
    stateAmount = widget.amount;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      width: width,
      height: height/6.4,
      decoration:  BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10)

      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(widget.coin),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('You have ${widget.amount} of ${widget.coin}'),
                IconButton(onPressed: (){
                  setState(() {
                    stateAmount = stateAmount++;
                  });
                },
                    icon: const Icon(Icons.add)),
                IconButton(onPressed: (){
                  setState(() {
                    if (widget.amount <= 0){
                      stateAmount = 0;
                    }else{
                      stateAmount = stateAmount--;
                    }
                  });
                },
                    icon: const Icon(Icons.remove)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
