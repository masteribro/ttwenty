import 'package:flutter/material.dart';

// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Component/loadingpage.dart';
import '../../../Constant/color.dart';
import '../../../Constant/constant.dart';
import '../../../partials /mixins/validation.dart';
import '../../../widget/text_form_field.dart';
import 'forgotpassword.dart';


class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State createState() => _SigninPageState();
}

class _SigninPageState extends StateMVC<SigninPage> with ValidationMixin {
  _SigninPageState() : super() {}
    bool obscureValue = true;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: AppColor.black,
        appBar: AppBar(
            leading: const SizedBox(),
            elevation: 0,
            backgroundColor: AppColor.black),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
            child: SizedBox(

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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      TextFormField(

                        validator: validateEmail,
                     decoration: Constants.defaultDecoration.copyWith(
                      labelText: "Enter your email",
                       filled: true,
                       fillColor: AppColor.bgGrey1,
                     ),),
                        SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                validator: validatePassword,


                decoration: Constants.defaultDecoration.copyWith(
                  filled: true,
                  fillColor: AppColor.bgGrey1,
                  labelText: "Enter your password",
                  focusColor: AppColor.white,
                ),)
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 40,
                              right: 15,
                              left: 15),
                          child: LoadingButton(
                            label: "Sign In",
                            onPressed: (){},
                            disabled: false, isLoading: null,

                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPassword()),
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.white,
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
