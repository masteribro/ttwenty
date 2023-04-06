import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Constant/constant.dart';

class CoinType extends StatefulWidget {
   CoinType({Key? key, required this.tokenStandard, required this.logo}) : super(key: key);
String tokenStandard;
String logo;

  @override
  State<CoinType> createState() => _CoinTypeState();
}

class _CoinTypeState extends State<CoinType> {
   String selectedValue = 'Option 1';
   List<String> coin =[
     "BTC",
     "ETH",
     "SOL",
     "USDT",
     "BNB"
   ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedValue,
        items: [
          DropdownMenuItem(
            value: 'Option 1',
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar()
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${coin[0]}', style: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Text(widget.tokenStandard, style: TextStyle(
                            fontSize: 1.2.h
                        ),),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          DropdownMenuItem(
            value: 'Option 2',
            child:Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar()
                        ],
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( '${coin[1]}', style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text(widget.tokenStandard, style: TextStyle(
                              fontSize: 1.2.h
                          ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'Option 3',
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar()
                        ],
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${coin[2]}', style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text(widget.tokenStandard, style: TextStyle(
                              fontSize: 1.2.h
                          ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'Option 4',
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar()
                        ],
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${coin[3]}', style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text(widget.tokenStandard, style: TextStyle(
                              fontSize: 1.2.h
                          ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'Option 5',
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar()
                        ],
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${coin[4]}', style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text(widget.tokenStandard, style: TextStyle(
                              fontSize: 1.2.h
                          ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ], onChanged: (String? value){
      setState(() {
        selectedValue = value! ;
      });
    });
  }
}