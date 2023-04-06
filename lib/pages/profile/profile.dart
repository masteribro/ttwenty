import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/utills/router.dart';

import '../../Component/transaction_type.dart';
import '../../Controller/auth_controller.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State createState() => _ProfileState();
}

class _ProfileState extends StateMVC<Profile> {
  _ProfileState() : super(AuthController()) {
    con = controller as AuthController;
  }
  late AuthController con;
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAccount(){
    var userInstance = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance.collection('userDetails').doc(userInstance!.uid).snapshots();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  GestureDetector(
                      onTap: (){
                        Routers.pop(context);
                      },
                      child: Icon(Icons.cancel_outlined)),
                  const Text('Profile'),
                  const Icon(Icons.qr_code_scanner_rounded),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              CircleAvatar(
                radius: 5.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: getAccount(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              Center(child: Text(
                                '${snapshot.data?['fName']} ${snapshot.data?['lName']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),)),
                              Center(child: Text('${snapshot.data?['email']}')),
                            ],
                          ),
                        ]);
                  }),

              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransactionType(
                    type: 'Share profile',
                    textColor: Colors.black,
                    height: 5.h,
                    width: 30.w,
                    borderRadius: 1.5.h,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  TransactionType(
                    type: 'Edit',
                    textColor: Colors.black,
                    height: 5.h,
                    width: 30.w,
                    borderRadius: 1.5.h,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Divider(
                thickness: 1.h,
              ),
              GestureDetector(
                  onTap: (){
                    con.signOut();
                  },
                  child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
