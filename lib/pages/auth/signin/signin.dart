import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Component/loadingpage.dart';
import '../../../Component/transaction_box.dart';
import '../../../Constant/color.dart';
import '../../../Constant/constant.dart';
import '../../../Controller/auth_controller.dart';
import '../../../partials /mixins/validation.dart';
import '../../../utills/router.dart';
import '../../Homepage/homepage.dart';
import 'forgotpassword.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State createState() => _SigninPageState();
}

class _SigninPageState extends StateMVC<SigninPage> with ValidationMixin {
  _SigninPageState() : super(AuthController()) {
    con = controller as AuthController;
  }

  late AuthController con;

  // bool obscureValue = true;
  String error = '';
  String amount = "N0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.black,
      appBar: AppBar(
          leading: const SizedBox(),
          elevation: 0,
          backgroundColor: AppColor.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: con.model.loginFormKey,
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
                        controller: con.model.emailController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "Enter your email",
                          filled: true,
                          fillColor: AppColor.bgGrey1,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: validatePassword,
                        controller: con.model.passwordController,
                        decoration: Constants.defaultDecoration.copyWith(
                          filled: true,
                          fillColor: AppColor.bgGrey1,
                          labelText: "Enter your password",
                          focusColor: AppColor.white,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
                        child: LoadingButton(
                          label: "Sign In",
                          isLoading: con.model.loading,
                          onPressed: () {  con.signIn();

                          }
                            //     () async {
                          //   if (con.model.loginFormKey.currentState!
                          //       .validate()) {
                          //     String loginPassword, loginEmail;
                          //     loginPassword =
                          //         con.model.passwordController.text.trim();
                          //     loginEmail =
                          //         con.model.emailController.text.trim();
                          //     dynamic result =
                          //         await con.signInWithEmailAndPassword(
                          //             loginEmail, loginPassword);
                          //     Routers.push(context, HomePage());
                          //     if (result != null) {
                          //       Routers.push(context, HomePage());
                          //     } else {
                          //       setState(() {
                          //         error = 'Please supply a valid email';
                          //       });
                          //     }
                          //   }
                          // },
                          // disabled: false,
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
                        child: const Text(
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
