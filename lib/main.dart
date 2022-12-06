import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ttwenty/router/routes.dart';

import 'Controller/auth_controller.dart';
import 'SplashScreen.dart';
import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return StreamProvider<UserModel?>.value(
            value: AuthController().user,
            initialData: null,
            child: MaterialApp(
              onGenerateRoute: generateRoute,
      title: 'Ttwenty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    ),
          );});
  }
}


