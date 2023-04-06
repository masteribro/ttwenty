import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/pages/Homepage/tabView/TabView3.dart';
import 'package:ttwenty/pages/Homepage/tabView/Tabview1.dart';
import 'package:ttwenty/pages/Homepage/tabView/Tabview2.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ttwenty/pages/Homepage/tabView/tabview4.dart';
import '../../Component/transaction_box.dart';
import '../../Controller/home_controller.dart';
import '../../main.dart';
import '../auth/Signup/regpage.dart';

int? coinNo = -1;

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State createState()  => _HomePageState();

}

class _HomePageState extends StateMVC<HomePage> with SingleTickerProviderStateMixin{
  _HomePageState () : super(HomeController()) {
    con = controller as HomeController;
  }
  late HomeController con;

  late TabController tabController;
  int intValue = 0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    const TabView1(),
    const TabView2(),
    const TabView3(),
    const TabView4(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 19,right: 19, top: 19),
            child: _widgetOptions.elementAt(_selectedIndex)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColor.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Earn',
            backgroundColor: AppColor.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'Transfer',
            backgroundColor: AppColor.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_sharp),
            label: 'Cards',
            backgroundColor: AppColor.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
       ),

    );



  }
}
