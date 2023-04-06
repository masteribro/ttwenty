import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/pages/create_wallet.dart';
import '../../../Component/transaction_box.dart';
import '../../../Component/transaction_type.dart';
import '../../../Controller/home_controller.dart';
import '../../../utills/firestore.dart';
import '../../../utills/router.dart';
import '../../profile/profile.dart';
import '../../send_transaction/send_transaction.dart';

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
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAccount(){
    var userInstance = FirebaseAuth.instance.currentUser;
     return FirebaseFirestore.instance.collection('userDetails').doc(userInstance!.uid).snapshots();

  }
    String amount = '0.00';
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    con.model.height = size.height;
    con.model.width = size.width;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Icon(Icons.help_outline),
                Row(
                  children:  [
                    Text('N$amount', style: const TextStyle(fontWeight: FontWeight.bold),),
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
              height: 4.w,
            ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.black,
                  borderRadius: BorderRadius.all(Radius.circular(3.h))
                ),
                width: MediaQuery.of(context).size.width,
                height: 25.h,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [

                          Row(
                            children: [
                              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                  stream: getAccount(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) {

                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    return Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text('${snapshot.data?['fName']} ${snapshot.data?['lName']}', style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),),
                                              SizedBox(
                                                height: 0.4.h,
                                              ),
                                              const Text('*****123', style: TextStyle(color: AppColor.white),),
                                            ],
                                          ),
                                        ],
                                        // children: snapshot.data!.docs.map((document) {
                                        //   return Column(
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     children: [
                                        //
                                        //       Text('${document['fName']} ${document['lName']}', style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),),
                                        //       SizedBox(
                                        //         height: 0.4.h,
                                        //       ),
                                        //       const Text('*****123', style: TextStyle(color: AppColor.white),),
                                        //     ],
                                        //   );
                                        // }).toList(),
                                      ),
                                    );
                                  }),

                              SizedBox(
                                width: 24.w,
                              ),
                              Image.asset('assets/visa4.png',height: 4.h,width: 20.w,),
                            ],
                          ),

                        ],
                      ),
                    ),
                
              ),
              SizedBox(
                height: 15.h,
              ),
            const Text('Current Balance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            const Text('N 0.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            SizedBox(
              height: 1.h,
            ),
            const Text('Fund your T20 wallet by transferring to your wallet', style: TextStyle(color: AppColor.grey1)),
            SizedBox(
              height: 1.h,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                      onTap: (){
                        Routers.push(context,  CreateWallet(privAddress: '',pubAddress: '', ));

                      },
                      child: TransactionType(type: 'Create Wallet', color: Colors.black, textColor: Colors.white,)),
                ],
              ),

          ],
        ),
      )
    );
  }

}


