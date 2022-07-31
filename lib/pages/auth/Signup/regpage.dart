import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Component/My_app_bar.dart';
import '../../../Component/loadingpage.dart';
import '../../../Constant/color.dart';
import '../../../Constant/constant.dart';
import '../../../Controller/auth_controller.dart';
import '../../../partials /mixins/validation.dart';
import '../../Homepage/homepage.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  State createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends StateMVC<ContactInfoPage> with ValidationMixin {
  _ContactInfoPageState() : super(AuthController()) {
    con = controller as AuthController;
  }
  late AuthController con;

  @override
  void initState() {
    super.initState();

    con.model.regPhoneNumberController.text = con.model.insertPhoneController.text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.defaultAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          height:  500,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: con.model.regFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    children: [
                      TextFormField(
                        validator: validateName,
                        controller: con.model.regFirstNameController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "First Name",
                        ),
                      ),
                      TextFormField(
                        validator: validateName,
                        controller: con.model.regLastNameController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "Last Name",
                        ),
                      ),
                      TextFormField(
                        validator: validatePhone,

                        // readOnly: true,
                        controller: con.model.regPhoneNumberController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "Phone Number",
                        ),
                      ),
                      TextFormField(
                        validator: validateEmail,
                        controller: con.model.regEmailController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "Email Address",
                        ),
                      ),
                      // TextFormField(
                      //   validator: validateDeviceType,
                      //   controller: con.model.regdeviceTypeController,
                      //   decoration: Constants.defaultDecoration.copyWith(
                      //     labelText: "Device Type",
                      //   ),
                      // ),
                      TextFormField(
                        validator: validatePassword,
                        obscureText: true,
                        controller: con.model.regPasswordController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "Password",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: con.model.regConfirmPassController,
                        decoration: Constants.defaultDecoration.copyWith(
                          labelText: "confirm password",
                        ),
                      ),

                      const SizedBox(height: 50),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primary,
                            ),
                            text: "By clicking on the register button, you have agreed to the ",
                            children: const [
                              TextSpan(
                                text: "terms & condition",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.primary,
                                ),
                              ),
                              TextSpan(
                                text: 'privacy policy',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(top: 40, right:15, left: 15),
                        child: LoadingButton(
                          isLoading: con.model.isLoading,
                          label: "Register",
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const HomePage ()),
                            );
                          },
                          disabled: con.model.regFormKey.currentState?.validate(),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
