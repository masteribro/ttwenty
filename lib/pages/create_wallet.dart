// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/utills/router.dart';

import '../utills/firestore.dart';
import '../utills/wallet_creation.dart';
import 'Homepage/tabView/Tabview1.dart';

class CreateWallet extends StatefulWidget {
   CreateWallet({Key? key, this.privAddress, this.pubAddress}) : super(key: key);
  String? pubAddress;
  String? privAddress;
  @override
  State<CreateWallet> createState() => _CreateWallet();
}

class _CreateWallet extends State<CreateWallet> {
  int? selected;
  String? pubAddress;
  String? privAddress;
  String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    details();
  }

  details() async {
    dynamic data = await getUserDetails();
    data != null?
    setState(() {
      privAddress = data['privateKey'];
      pubAddress = data['publicKey'];
      username = data['user_name'];
      bool created = data['wallet_created'];
      created == true ? selected = 1 : selected = 0;
    }):
    setState(() {
      selected = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Wallet Information"),
        actions: [
          IconButton(
            icon: const Icon(Icons.backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          selected == 1
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text("Add a Wallet"),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      setState(() {
                        selected = 1;
                      });
                      WalletAddress service = WalletAddress();
                      final mnemonic = service.generateMnemonic();
                      final privateKey =
                      await service.getPrivateKey(mnemonic);
                      final publicKey =
                      await service.getPublicKey(privateKey);
                      privAddress = privateKey;
                      pubAddress = publicKey.toString();

                      addUserDetails(privateKey, publicKey);
                    },
                  ))
            ],
          )
              : Column(
            children: [
              Center(
                  child: Container(
                    margin:  EdgeInsets.all(3.h),
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3.h)),
                    child: const Text(
                      "Successfully initiated wallet!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )),
              const Center(
                child: Text(
                  "Wallet Private Address :",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${widget.privAddress}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Do not reveal your private address to anyone!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              const Divider(),
              const Center(
                child: Text(
                  "Wallet Public Address : ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${widget.pubAddress}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              const Divider(),
               Center(
                child: TextButton(onPressed: () {
                  Routers.replaceAll(context, widget);
                }, child: const Text(
                     "Go back to main page!"
                                 ),


                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
