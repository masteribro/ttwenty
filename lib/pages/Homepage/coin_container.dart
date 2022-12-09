import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Controller/home_controller.dart';

class CoinContainer extends StatefulWidget {
  final int id ;
  final Color color;
  final int amount;
  const CoinContainer({Key? key,  required this.color,required this.id, required this.amount,}) : super(key: key);

  @override
  State createState() => _CoinContainerState();
}

class _CoinContainerState extends StateMVC<CoinContainer> {
  _CoinContainerState () : super(HomeController()) {
    con = controller as HomeController;
  }
  late HomeController con;
  int stateAmount = 0;

  @override
  void initState() {
    stateAmount = widget.amount;
    super.initState();
  }

var initialItem = 'Select coin';
List <String> coin = [
  'bitcoin',
  'Ethereum',
  'Litecoin',
  'Dogecoin',
  "Solana"
];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      width: width,
      height: height/5,
      decoration:  BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10)

      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: (){
                      setState((){
                        con.model.listOfCoins.removeAt(con.model.id ?? -1);
                      });

                      print(con.model.listOfCoins);
                    },
                    icon: const Icon(Icons.cancel)
                )
              ],
            ),
            // DropdownButton(
            //
            // onChanged: (value){
            //
            //   setState(() {
            //     initialItem = value.toString();
            //   });
            // },
            // value: initialItem,
            //   items: coin.map((item) {
            //       return DropdownMenuItem(value: item, child: Text(item));
            //     }).toList(),
            //     ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('You have ${widget.amount} of $initialItem'),
                IconButton(onPressed: (){
                },
                    icon: const Icon(Icons.add)),
                IconButton(
                  icon: const Icon(Icons.remove), onPressed: () {  },),

              ],
            )
          ],
        ),
      ),
    );
  }
}