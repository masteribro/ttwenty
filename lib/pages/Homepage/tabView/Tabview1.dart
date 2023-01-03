import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Component/transaction_box.dart';
import '../../../Component/transaction_type.dart';
import '../../../Controller/home_controller.dart';
import '../../profile/profile.dart';

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
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  child: const Icon(Icons.person_outline_sharp))
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
            height: 12.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                 Column(
                   children: [
                     TransactionBox(icon: Icons.monetization_on_outlined,),
                     SizedBox(height: 1.h,),
                     const Text('Add cash')
                   ],
                 ),
                SizedBox(
                  width: 4.w,
                ),
                 Column(
                   children: [
                     TransactionBox(icon: Icons.phone_android,),
                     SizedBox(height: 1.h,),
                     const Text('Buy Airtime')
                   ],
                 ),
                SizedBox(
                  width: 4.w,
                ),
                 Column(
                   children: [
                     TransactionBox(icon: Icons.wifi_tethering_outlined,),
                     SizedBox(height: 1.h,),
                     const Text('Data Bundle')
                   ],
                 ),
                SizedBox(
                  width: 4.w,
                ),
                 Column(
                   children: [
                     TransactionBox(icon: Icons.receipt_long_rounded,),
                     SizedBox(height: 1.h,),
                     const Text('Pay Bills')
                   ],
                 ),
              ],
            ),
          ),
            SizedBox(
              height: 55.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransactionType(type: 'Request', color: Colors.white, textColor: Colors.black,),
                SizedBox(
                  width: 15.w,
                ),
                TransactionType(type: 'Send', color: Colors.black, textColor: Colors.white,),
              ],
            ),

        ],
      )
    );
  }

}


