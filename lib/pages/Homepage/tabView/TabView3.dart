import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Constant/color.dart';
import '../homepage.dart';

class TabView3 extends StatefulWidget {
  const TabView3({Key? key}) : super(key: key);

  @override
  State<TabView3> createState() => _TabView3State();
}

class _TabView3State extends State<TabView3> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )
          ),
          child: Column(
            children: [
              ElevatedButton(onPressed: ()async{
                final dynamicLinkParams = DynamicLinkParameters(
                  link:
                  Uri.parse("https://your.website.page/coin${coinNo} "),///web browser
                  uriPrefix: "https://ttwenty.page.link",///live url
                  androidParameters: AndroidParameters(
                      packageName: "com.example.ttwenty ",
                      fallbackUrl: Uri.parse('https://myandroidapp.link')),
                  // iosParameters: IOSParameters(
                  //     bundleId: "com.example.app.ios",
                  //     fallbackUrl: Uri.parse('https://myiosapp.link')),
                );

                //for long url
                // final link = await FirebaseDynamicLinks.instance
                //     .buildLink(dynamicLinkParams);
                //for short url
                final dynamicLink = await FirebaseDynamicLinks.instance
                    .buildShortLink(dynamicLinkParams);

                await Share.share(dynamicLink.shortUrl.toString());
              }, child: const Text('share')),
            ],
          ),
        )
    );
  }
}
