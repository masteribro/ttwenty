
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


import 'package:mvc_pattern/mvc_pattern.dart';


import '../model/auth_model.dart';
import '../repository/auth_repo.dart';
import '../utills/FlushBarMixin.dart';


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

  void signIn() async {

  }

  void signUp() async {
;
    }


  }

  void verifyOTP() async {

  }
  void phoneVerification() async {


  }



  void signOut(BuildContext context) async {

  }


