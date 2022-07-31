import 'package:flutter/material.dart';

import '../pages/auth/Signup/signup.dart';
import '../pages/auth/signin/forgotpassword.dart';
import '../pages/auth/signin/signin.dart';




Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/phone_page':
      return MaterialPageRoute(builder: (_) =>  const PhoneNumberPage());
    case '/sign_in':
      return MaterialPageRoute(builder: (_) =>  SigninPage());
    case '/forgotPass':
      return MaterialPageRoute(builder: (_) =>  ForgotPassword());





    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
