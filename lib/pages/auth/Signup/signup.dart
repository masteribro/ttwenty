// import 'package:flutter/material.dart';
//
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
//
// import '../../../Component/dismisskeyboard.dart';
// import '../../../Component/loadingpage.dart';
// import '../../../Constant/color.dart';
// import '../../../Constant/constant.dart';
// import '../../../Controller/auth_controller.dart';
// import '../../../partials /mixins/validation.dart';
//
//
// class PhoneNumberPage extends StatefulWidget {
//   const PhoneNumberPage({Key? key}) : super(key: key);
//
//   @override
//   State createState() => _PhoneNumberPageState();
// }
//
// class _PhoneNumberPageState extends StateMVC<PhoneNumberPage> with ValidationMixin {
//   _PhoneNumberPageState() : super(AuthController()) {
//     con = controller as AuthController;
//   }
//   late AuthController con;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(leading: const SizedBox(), elevation: 0, backgroundColor: Colors.transparent),
//       body: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: 500,
//             child: DismissKeyboard(
//               child: Form(
//                 key: con.model.insertPhoneFormKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Get Started',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.primary,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           'Enter your phone number. (required)',
//                           style:  TextStyle(
//                             fontSize: 17,
//                             color: AppColor.primary,
//                           ),
//                         ),
//                         TextFormField(
//                           // focusNode: FocusNode(),
//                           validator: validatePhone,
//                           keyboardType: TextInputType.phone,
//                           controller: con.model.insertPhoneController,
//
//                           decoration: Constants.inputDecoration.copyWith(
//                             prefixIcon: const Padding(
//                               padding: EdgeInsets.all(15),
//                               child: Text(
//                                 " +1 ",
//                                 style: TextStyle(color: AppColor.primary, fontSize: 15),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 100),
//                     Column(
//                       children: [
//
//                         RichText(
//                           textAlign: TextAlign.center,
//                           text: const TextSpan(
//                             text: "Note: \n",
//                             children: [
//                               TextSpan(
//                                 text: "iPhone users can call ",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: AppColor.primary,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'customer care',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: AppColor.textGreen10,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '\nto register and book rides',
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: AppColor.primary,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.only(top: 40, right: 0, left: 0),
//                           child: LoadingButton(onPressed: con.phoneVerification,
//                             isLoading: con.model.isLoading,
//                             label: (con.model.insertPhoneFormKey.currentState?.validate() == true) ? "Verify Number" : "Continue",
//
//                         ),),
//
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
