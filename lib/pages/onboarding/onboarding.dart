import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ttwenty/pages/auth/Signup/signup.dart';
import 'package:ttwenty/pages/auth/signin/signin.dart';

import '../../Constant/color.dart';
import '../../utills/router.dart';
import '../auth/Signup/regpage.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.black,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 50, top: 0),
              child: Row(
                children: const [
                  Text(
                    'Twenty',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/ttwenty.jpeg', fit: BoxFit.scaleDown),
            ),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Simple Wallet Control, Easy Transfer Money \n",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),

                children: [
                  TextSpan(
                    text: "Fast execution, real time market data and smart notification ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'The future is in your hand all the things are easy with twenty',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.white,

                    ),
                  ),
                  TextSpan(
                    text: '\n Trade Wisely ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Note: \n",
                children: [
                  TextSpan(
                    text: "iPhone users can call ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'customer care',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.textGreen10,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: '\nto register and book rides',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 15, left: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ContactInfoPage()),
                  );
                    },
                child: const Text("Get Started"),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                  backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(.3)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Routers.pushNamed(context, '/sign_in');
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.textGreen10,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

}
