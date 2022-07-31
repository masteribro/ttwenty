import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ttwenty/pages/auth/Signup/regpage.dart';

import '../../../Component/loadingpage.dart';
import '../../../Constant/color.dart';
import '../../../Constant/constant.dart';
import '../../../Controller/auth_controller.dart';
import '../../../partials /mixins/validation.dart';
import '../../../utills/router.dart';


class OTPPage extends StatefulWidget {
  final String uuid;

  const OTPPage({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  State createState() => _OTPPageState();
}

class _OTPPageState extends StateMVC<OTPPage> with ValidationMixin {
  _OTPPageState() : super(AuthController()) {
    con = controller as AuthController;
  }
  late AuthController con;
  String otpValue = "1234";
  String errorMssg = "enter 1234 to proceed";
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox(), elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 500,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: con.model.otpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Otp has been sent to your number',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColor.primary,
                        ),
                      ),
                      const SizedBox(height: 30),
                      /* TextFormField(
                        focusNode: FocusNode(),
                        keyboardType: TextInputType.number,
                        validator: validateOTP,
                        controller: con.model.otpController,
                        decoration: Constants.defaultDecoration.copyWith(labelText: "otp"),
                      ),*/
                      TextFormField(
                        validator: validateOTP_Test,
                        controller: con.model.otpController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "OTP",
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(onPressed: (){}, child: const Text('Resend OTP')),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
                        child: LoadingButton(
                            isLoading: con.model.isLoading,
                            label: "Continue",
                            // onPressed: con.verifyOTP
                            onPressed: (){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ContactInfoPage()),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
