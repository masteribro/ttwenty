



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


import 'package:mvc_pattern/mvc_pattern.dart';


import '../model/auth_model.dart';
import '../model/user.dart';
import '../pages/Homepage/homepage.dart';
import '../pages/auth/Signup/Otp.dart';
import '../pages/auth/Signup/regpage.dart';
import '../repository/auth_repo.dart';
import '../utills/FlushBarMixin.dart';
import '../utills/router.dart';


class AuthController extends ControllerMVC with FlushBarMixin {
  factory AuthController([StateMVC? state]) =>
      _this ??= AuthController._(state);
  final logger = Logger();

  AuthController._(StateMVC? state)
      : model = AuthModel(),
        super(state);
  static AuthController? _this;

  final AuthModel model;

  final AuthRepo authRepo = AuthRepo();
  final FirebaseAuth auth = FirebaseAuth.instance;


  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }
  Stream<UserModel?> get user {
    return model.auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));

  }


  Future signIn() async {
    if (true) {
      setState(() {
        model.loading = true;
      });
      print(model.loading);

      try {
        var signInCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: model.emailController.text.trim(),
            password: model.passwordController.text.trim());
        if (signInCredentials.user?.uid != null) {
          print(signInCredentials.user?.uid);

          // Routers.push(state!.context, HomePage());
          Navigator.push(
            state!.context,
            MaterialPageRoute(builder: (context) =>  HomePage()),
          );

          showSuccessNotificationWithTime(state!.context,'success', 5);
        } else {
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        showSuccessNotification(state!.context, '$e');
      }

      setState(() {
        model.loading = false;
      });
    }
  }


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  void verifyOTP() async {

  }

  void phoneVerification() async {
    if (1 == 1) {
      setState(() {
        model.isLoading = true;
      });
      if (model.insertPhoneFormKey.currentState?.validate() == true) {
        model.auth.verifyPhoneNumber(
          phoneNumber: model.insertPhoneController.text,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await model.auth.signInWithCredential(credential).then((value) {
              print('you are logged in uhbhbhj');
            });
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception.message);
          },
          codeSent: (String verifcationID, int? resendToken) {},
          codeAutoRetrievalTimeout: (String verifcationID,) {
            model.verificationIdReceived = verifcationID;
          },);


        Navigator.push(
          state!.context,
          MaterialPageRoute(builder: (context) => OTPPage(uuid: '',)),

        );
      } else {
        showErrorNotification(state!.context, 'error');
      }
    }
    setState(() {
      model.isLoading = false;
    });
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: model.verificationIdReceived,
        smsCode: model.otpController.text);
    await model.auth.signInWithCredential(credential).then((value) {
      print('master is in charge');
    });
    Navigator.push(
        state!.context,
        MaterialPageRoute(builder: (context) => const ContactInfoPage()));
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await model.auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void signOut(BuildContext context) async {

  }
}

















