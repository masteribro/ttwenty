import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Constant/color.dart';
import '../../../partials /mixins/validation.dart';
import '../../../widget/text_form_field.dart';
import 'forgotpassword.dart';


class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State createState() => _SigninPageState();
}

class _SigninPageState extends StateMVC<SigninPage> with ValidationMixin {
  _SigninPageState() : super() {
    bool obscureValue = true;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            leading: const SizedBox(),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Adaptive.w(5), vertical: 10),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Adaptive.h(100) - 100,
              child: Form(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Center(
                          child: Image(
                            height: 100,
                            image: AssetImage(
                              'assets/ttwenty.jpeg',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        EditTextForm(
                          validator: validateEmail,

                          isMuchDec: true,
                          readOnly: false,
                          obscureText: false,
                          label: 'Email',
                        ),
                        const SizedBox(height: 10),
                        EditTextForm(
                          onPasswordToggle: () {
                            setState(() {
                              obscureValue = !obscureValue;
                            });
                          },
                          suffixIcon: obscureValue
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: obscureValue,
                          isMuchDec: true,
                          readOnly: false,

                          label: 'Password',
                          validator: validatePassword,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 40,
                              right: Adaptive.w(15),
                              left: Adaptive.w(15)),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('signin'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()),
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColor.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}