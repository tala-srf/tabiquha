import 'dart:async';

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';


import 'package:tabiquha/UI/ui.dart';
import 'package:tabiquha/UI/widget_ui.dart';

class SplashUI2 extends StatefulWidget {
  const SplashUI2({Key? key}) : super(key: key);

  @override
  State<SplashUI2> createState() => _SplashUI2State();
}

class _SplashUI2State extends State<SplashUI2> {
  late Timer timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
   AutoOrientation.portraitAutoMode();
    timer = Timer.periodic(
        const Duration(seconds: 3), (_) => setState(() => count += 1));

    // Some simplest connection :F
  }

  Widget _renderWidget() {
    return count == 0 ? _renderWidget1() : _renderWidget3();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

Widget _renderWidget3(){
  return FutureBuilder(
               future: FlutterBluetoothSerial.instance.requestEnable(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return  Widget2();
                  else if (snapshot.connectionState == ConnectionState.done) {
                    return UI();
                  } else
                    return UI();
                },
              );
}
  Widget _renderWidget1() {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(360 / 360),
      child: Center(
          child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "مرحباً بأشبال المستقبل ",
          style: TextStyle(
              fontFamily: "FF", fontSize: 50, color: Color(0xffd753a1)),
        ),
      )),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Hero(
          tag: "tala",
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/asd.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              )),
              child: AnimatedSwitcher(
                  duration: const Duration(seconds: 3),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(-1, 0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: _renderWidget()))),
    );
  }
}


