import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/utills/router.dart';

import '../../Component/transaction_type.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('user').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((document) {
                        return Column(
                          children: [
                            Center(child: Text('${document['fName']} ${document['lName']}',style: TextStyle(fontWeight: FontWeight.bold),)),
                            Center(child: Text('${document['email']}')),
                          ],
                        );
                      }).toList(),
                    );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
