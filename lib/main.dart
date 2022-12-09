import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
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
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

  runApp( MyApp(
      initialLink:initialLink,
  ));
}
String? dynamicPath;
class MyApp extends StatefulWidget {
  final PendingDynamicLinkData? initialLink;
  const MyApp({Key? key, this.initialLink}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  initState() {
    if (widget.initialLink != null) {
      dynamicPath = widget.initialLink!.link!.path;
    }
    super.initState();
  }
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


