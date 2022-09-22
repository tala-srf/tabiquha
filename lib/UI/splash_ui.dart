import 'dart:async';

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> with TickerProviderStateMixin {
  late Timer timer;
  int count = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    AutoOrientation.portraitAutoMode();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    timer = Timer.periodic(
        const Duration(seconds: 3), (_) => setState(() => count += 1));
    timer = Timer.periodic(
        const Duration(seconds: 8),
        (_) =>
            setState(() => Navigator.of(context).popAndPushNamed('/splash2')));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
    timer.cancel();
  }

  Widget _renderWidget() {
    return count == 1 ? _renderWidget2() : _renderWidget1();
  }

  Widget _renderWidget1() {
    return const RotationTransition(
      turns: AlwaysStoppedAnimation(360 / 360),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Color(0xff17e3d2),
          radius: 120,
        ),
      ),
    );
  }

  Widget _renderWidget2() {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 123,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 120,
          child: Container(
            child: ScaleTransition(
              scale: _animation,
              alignment: Alignment.center,
              child: Center(
                child: Image.asset(
                  "assets/image/3d.png",
                  height: 180,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff9374c2),
        body: Hero(
          tag: "tala",
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/Artboard.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              )),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween(
                      begin: const Offset(0, 0),
                      end: const Offset(0, 0.0),
                    ).animate(animation),
                    child: child,
                  );
                },
                child: _renderWidget(),
              )),
        ));
  }
}
