import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tabiquha/UI/menu.dart';
import 'package:tabiquha/UI/no_page.dart';
import 'package:tabiquha/UI/page_video.dart';
import 'package:tabiquha/UI/splash2_ui.dart';
import 'package:tabiquha/UI/splash_ui.dart';

import 'package:tabiquha/UI/ui1.dart';
import 'package:tabiquha/UI/ui2.dart';
import 'package:tabiquha/UI/ui3.dart';
import 'package:tabiquha/UI/ui4.dart';
import 'package:tabiquha/UI/ui5.dart';
import 'package:tabiquha/UI/yes_end.dart';
import 'package:tabiquha/UI/yes_page.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],

        //debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        routes: {
          '/splash2': (ctxt) => const SplashUI2(),
          '/Menu': (ctxt) => const Menu(),
          '/ui1': (ctxt) => const UI1(),
          '/ui2': (ctxt) => const UI2(),
          '/ui3': (ctxt) => const UI3(),
          '/ui4': (ctxt) => const UI4(),
          '/ui5': (ctxt) => const UI5(),
          '/vv': (ctxt) => const PageVideo(),
          '/yes': (ctxt) => YesPage(),
          '/yesend': (ctxt) => YesEndPage(),
          '/no': (ctxt) => NoPage(),
        },
        home: const Splash1());
  }
}
