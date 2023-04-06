
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Component/loadingpage.dart';
import 'package:web3dart/web3dart.dart';

import '../../../Component/coin_type.dart';
import '../../../Constant/color.dart';
import '../../../utills/firestore.dart';

class TabView2 extends StatefulWidget {
  const TabView2({Key? key}) : super(key: key);

  @override
  State<TabView2> createState() => _TabView2State();
}

class _TabView2State extends State<TabView2> {
  late Client httpClient;
  late Web3Client ethClient;
  String privAddress="";
  EthereumAddress targetAddress = EthereumAddress.fromHex("0xfed0d2b05602d8b3b0fe5b7eb80f124ee98013cd");
  bool? created;
  var balance;
  var credentials;
  int myAmount = 5;
  var pro_pic;
  var u_name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpClient = Client();
    ethClient = Web3Client("https://rinkeby.infura.io/v3/4c98357a2edc4fce82379fe98baa9f97",httpClient);
    details();
  }
  details() async {
    dynamic data = await getUserDetails();
    data != null ?
    setState(() {
      privAddress = data['privateKey'];
      var publicAdress = data['publicKey'];
      var temp = EthPrivateKey.fromHex(privAddress);
      credentials = temp.address;
      // EthPrivateKey fromHex = EthPrivateKey.fromHex(privAddress);
      // final password = FirebaseAuth.instance.currentUser!.uid;
      // Random random=Random.secure();
      // Wallet wallet = Wallet.createNew(fromHex, password,random);
      // print(wallet.toJson());
      created = data['wallet_created'];
      balance = getBalance(credentials);
    }):
    print("Data is NULL!");
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi/abi.json");
    String contractAddress = "0x4a151003126f41c5cb23e31f5f29da05676e9cae";
    final contract = DeployedContract(ContractAbi.fromJson(abi, "Gold"), EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(EthereumAddress credentialAddress) async {
    List<dynamic> result = await query("balanceOf",[credentialAddress]);
    var data = result[0];
    setState(() {
      balance = data;
    });
  }

  Future<String> sendCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit("transfer",[targetAddress,bigAmount]);
    return response;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    EthPrivateKey key = EthPrivateKey.fromHex(privAddress);
    Transaction transaction = await Transaction.callContract(contract: contract, function: ethFunction, parameters: args, maxGas: 100000);
    print(transaction.nonce);
    final result = await ethClient.sendTransaction(key,transaction ,chainId:4);
    return result;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children:   [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('You send'),
               Padding(
                 padding:  EdgeInsets.only(top: 1.h),
                 child: CoinType(tokenStandard: 'Bep20',  logo: '',),
               )
             ],
           ),
           Row(
             children: [
               SizedBox(
                 width: 26.w,
                 child: TextField(

                 ),
               )

             ],
           ),
           SizedBox(
             height: 10.h,
           ),
           LoadingButton(isLoading: false, label: "Send", onPressed: (){})

         ],
        ),
      ),
    );
  }
}
