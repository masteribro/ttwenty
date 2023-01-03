import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/utills/router.dart';

import '../../Component/loadingpage.dart';
import '../../Constant/color.dart';

class SendTransaction extends StatefulWidget {
  const SendTransaction({Key? key}) : super(key: key);

  @override
  State<SendTransaction> createState() => _SendTransactionState();
}

class _SendTransactionState extends State<SendTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    GestureDetector(
                        onTap: (){
                          Routers.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Text('Send Cash',style: TextStyle(fontWeight: FontWeight.bold,),),
                    const SizedBox()
                  ],
                ),
                SizedBox(height: 5.h,),
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
                SizedBox(height: 1.h,),
                const CircleAvatar(

                ),
                SizedBox(height: 4.h,),
                Row(
                  children: const [
                    Text('Amount'),
                  ],
                ),
                SizedBox(
                    height: 4.h,
                    child: TextFormField()),
                SizedBox(height: 2.h,),
                Row(
                  children: const [
                    Text('Note'),
                  ],
                ),
                SizedBox(
                    height: 4.h,
                    child: TextFormField()),
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('This transaction is FREE', style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.textGreen10),),
                  ],
                ),
                SizedBox(height: 24.h,),
                const Text('Important:', style: TextStyle(fontWeight: FontWeight.bold),),
                const Text('Check the @Chipper Tag before sending'),
                SizedBox(height: 2.h,),
                LoadingButton(
                    label: "Send",
                    isLoading: null,
                    onPressed: () {
                    }
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
