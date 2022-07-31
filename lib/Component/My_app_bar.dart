import 'package:flutter/material.dart';

import '../Constant/color.dart';


class MyAppBar {
  static PreferredSizeWidget? defaultAppBar(BuildContext context){
    return AppBar(
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios, color: AppColor.primary,)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}