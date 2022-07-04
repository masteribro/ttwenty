import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttwenty/Constant/color.dart';
import 'package:ttwenty/pages/onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColor.black,
      body: Center(
        child: InkWell(
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  OnboardingPage()),
          );},
          child: Image.asset('assets/ttwenty.jpeg',
            scale: 6,
          ),
        ),
      ),
    );
  }
}
