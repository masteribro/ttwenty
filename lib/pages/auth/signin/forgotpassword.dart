import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Component/dismisskeyboard.dart';
import '../../../Constant/color.dart';
import '../../../Constant/constant.dart';
import '../../../Component/loadingpage.dart';
import '../../../partials /mixins/validation.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword ({Key? key}) : super(key: key);

  @override
  State createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends StateMVC<ForgotPassword>
    with ValidationMixin {
  _ForgotPasswordState() : super() {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const SizedBox(),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5), vertical: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Adaptive.h(100) - 100,
            child: DismissKeyboard(
              child: Form(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          'Enter your email address.',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          focusNode: FocusNode(),
                          validator: validateEmail,
                          keyboardType: TextInputType.emailAddress,

                          decoration: Constants.inputDecoration.copyWith(
                            labelText: "Email Address",

                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 40, right: 0, left: 0),
                          child: LoadingButton(label: 'Create Password', isLoading: null, onPressed: () {  },



                            /*   onPressed: (){
                                Routers.pushNamed(context, '/otp_page');} */
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}