import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';
import '../../../Component/My_app_bar.dart';
import '../../../Component/transaction_box.dart';
import '../../../Component/transaction_type.dart';
import '../../../Controller/home_controller.dart';

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
    String amount = '0.00';
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    con.model.height = size.height;
    con.model.width = size.width;
    return Scaffold(
      body:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Icon(Icons.help_outline),
              Row(
                children:  [
                  Text('N$amount', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Icon(Icons.arrow_circle_down)
                ],
              ),
              Icon(Icons.person_outline_sharp)
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Help'),
              Text('Wallet',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Profile')
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 7.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const TransactionBox(),
                SizedBox(
                  width: 4.w,
                ),
                const TransactionBox(),
                SizedBox(
                  width: 4.w,
                ),
                const TransactionBox(),
                SizedBox(
                  width: 4.w,
                ),
                const TransactionBox(),
              ],
            ),
          ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransactionType(type: 'Request', color: Colors.red,),
                SizedBox(
                  width: 15.w,
                ),
                TransactionType(type: 'Send', color: Colors.orange,),
              ],
            ),

        ],
      )
    );
  }

}


