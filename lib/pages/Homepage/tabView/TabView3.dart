import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart' as web3;

import '../../../Component/loadingpage.dart';
import '../../../Constant/color.dart';
import '../../../utills/firestore.dart';
import '../../../utills/provider.dart';
import '../../../utills/router.dart';
import '../../../utills/wallet_creation.dart';
import '../../create_wallet.dart';

class TabView3 extends StatefulWidget {
  const TabView3({Key? key}) : super(key: key);

  @override
  State<TabView3> createState() => _TabView3State();
}

class _TabView3State extends State<TabView3> {
  int? selected;
  String? pubAddress;
  String? privAddress;
  String? username;

  var credentials;
  bool? created;
  int myAmount = 5;
  late Client httpClient;
  late web3.Web3Client ethClient;
  EthereumAddress targetAddress = EthereumAddress.fromHex("0xfed0d2b05602d8b3b0fe5b7eb80f124ee98013cd");
  TextEditingController amount = TextEditingController();
  TwentyProvider? twentyProvider;
  @override
  void initState() {

    twentyProvider = Provider.of<TwentyProvider>(context, listen: false);
    super.initState();
    httpClient = Client();
    ethClient = web3.Web3Client("https://eth-mainnet.g.alchemy.com/v2/gwXXhsivs6I9y4wFxjYfb7JZ2MwtwN_e",httpClient);
    details();
  }
  details() async {
    dynamic data = await getUserDetails();
    data != null ?
    setState(() {
      privAddress = data['privateKey'];
      var publicAdress = data['publicKey'];
      var temp = EthPrivateKey.fromHex(privAddress!);
      credentials = temp.address;
      created = data['wallet_created'];
      twentyProvider?.balance = getBalance(credentials) ;
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
      twentyProvider?.balance = data;
    });
  }

  Future<String> sendCoin() async {
   num sendAmount = num.parse(amount.text);
   print(" amount send: $sendAmount");
    var bigAmount = BigInt.from(sendAmount);
    print("Get balance: $bigAmount");
    var response = await submit("transfer",[targetAddress,bigAmount]);
    print("Get data: $response");
    return response;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    EthPrivateKey key = EthPrivateKey.fromHex(privAddress!);
    web3.Transaction transaction = await web3.Transaction.callContract(contract: contract, function: ethFunction, parameters: args, maxGas: 100000);
    print(transaction.data);
    final result = await ethClient.sendTransaction(key,transaction ,chainId:4);
    print("Get transaction result: $result");
    return result;
  }
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
                    child: TextFormField(
                      controller: amount,
                      keyboardType: TextInputType.number,
                    )),
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
                LoadingButton(
                    label: "Send",
                    isLoading: null,
                    onPressed: ()async {
                      setState(() {
                        selected = 1;
                      });
                      WalletAddress service = WalletAddress();
                      final mnemonic = service.generateMnemonic();
                      final privateKey = await service.getPrivateKey(mnemonic);
                      final publicKey = await service.getPublicKey(privateKey);
                      privAddress = privateKey;
                      pubAddress = publicKey.toString();
                      print("Get private key $privAddress");
                      print("Get public key $pubAddress");
                      addUserDetails(privAddress, pubAddress);
                    var sendCrypto = await sendCoin();
                    print('send coin: $sendCrypto');
                      // Routers.push(context,  CreateWallet(privAddress: privAddress,pubAddress: pubAddress, ));
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
