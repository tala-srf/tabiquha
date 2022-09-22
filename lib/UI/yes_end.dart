import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YesEndPage extends StatefulWidget {
  YesEndPage({Key? key}) : super(key: key);

  @override
  State<YesEndPage> createState() => _YesEndPageState();
}

class _YesEndPageState extends State<YesEndPage> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/end.aac";
  bool isplaying = false;
  bool audioplayed = false;

  AudioPlayer player = AudioPlayer();
  late Timer timer;
  int count = 0;

  initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes = await rootBundle.load(audioasset);
      Uint8List audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      player.playBytes(audiobytes);
    });
    super.initState();

    timer = Timer.periodic(
        const Duration(seconds: 5), (_) => setState(() => count += 1));
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      Navigator.of(context).popAndPushNamed("/Menu");
            AutoOrientation.portraitUpMode();
    });
  }

  @override
  dispose() {
    player.stop();
    super.dispose();
    timer.cancel();
  }

  Widget _renderWidget() {
    return count == 1 ? Text("") : _renderWidget1();
  }

  Widget _renderWidget1() {
    return const RotationTransition(
      turns: AlwaysStoppedAnimation(360 / 360),
      child: Center(child: Image(image: AssetImage("assets/image/end@4x.png"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9374c2),
      body: Container(
         decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/ques.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(child: _renderWidget()),
        ),
      ),
    );
  }
}
