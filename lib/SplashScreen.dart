import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/pages/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColor.black,
      body: Center(
        child: Image.asset('assets/ttwenty.jpeg',
          scale: 6,
        ),
      ),
    );
  }

  void navigateToNextPage(context) async {
    Timer( Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OnboardingPage()
    )) );

  }
}
