import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_doctor/ui/main_page.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:your_doctor/util/dependency_injection.dart';

void main() async {
  await Injector.configure(Flavor.MOCK);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: "Cairo",
        bottomAppBarColor: ThemeColors.white60,
        canvasColor: ThemeColors.CanvasColor,
        // setting canvasColor to transparent
        primarySwatch: Colors.teal,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? ThemeColors.PrimaryColor
            : null,
        accentColor: ThemeColors.AccentColor,
      ),
      home: new MainPage(
        isLoggedIn: false,
        fromBack: false,
        pagId: 0,
      ),
    );
  }
}
