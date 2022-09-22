//import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lottie/lottie.dart';
import 'package:tabiquha/UI/ques1.dart';
import 'package:tabiquha/UI/select_device.dart';

import 'package:video_player/video_player.dart';

class PageVideo extends StatelessWidget {
  const PageVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height /
                MediaQuery.of(context).size.width >
            1
        ? Scaffold(
            //   backgroundColor: const Color(0xff17e3d2),

            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/image/asdf.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                )),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("من فضلك ضع الهاتف  ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  color: Colors.white)),
                          Text("  في المكان المناسب للطفل ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  color: Colors.white)),
                          // Text(" المناسب للطفل",
                          //     style: TextStyle(
                          //         fontFamily: "FF",
                          //         fontSize:
                          //             MediaQuery.of(context).size.height * 0.05,
                          //         color: Colors.white)),
                        ],
                      ),
                      Video(),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                        child: Image.asset(
                          "assets/image/wordmark.png",
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ))
                    ],
                  ),
                )))
        : Scaffold(
            backgroundColor: const Color(0xff17e3d2),
            body: Container(
                height: double.infinity,
                width: double.infinity,
                child: Video()));
  }
}

class Video extends StatefulWidget {
  Video({
    Key? key,
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  final asset = 'assets/videos/alef.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    // AutoOrientation.fullAutoMode();
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height /
                MediaQuery.of(context).size.width >
            1
        ? Column(
            children: [
              VideoPlayerWidget(
                controller: controller,
              ),
              Button12(
                controller: controller,
              )
            ],
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: VideoPlayerWidget(
                  controller: controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 300),
                child: Button12(
                  controller: controller,
                ),
              )
            ],
          );
  }
}

class Button12 extends StatefulWidget {
  final VideoPlayerController controller;

  const Button12({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<Button12> createState() => _Button12State();
}

class _Button12State extends State<Button12> {
  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () async{

                    
                    widget.controller.pause();
                   final BluetoothDevice? selectedDevice =
                      await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectBondedDevicePage(checkAvailability: false);
                      },
                    ),
                  );

                  if (selectedDevice != null) {
                    print('Connect -> selected ' + selectedDevice.address);
                    _startChat(context, selectedDevice);
                  } else {
                    print('Connect -> no device selected');
                  }
                  },
                  child: Image.asset("assets/image/Asset16@4x.png",
                      height: MediaQuery.of(context).size.height /
                                  MediaQuery.of(context).size.width >
                              1
                          ? MediaQuery.of(context).size.height * 0.07
                          : MediaQuery.of(context).size.height * 0.12)),
              MediaQuery.of(context).size.height /
                          MediaQuery.of(context).size.width >
                      1
                  ? SizedBox(width: MediaQuery.of(context).size.width * 0.12)
                  : SizedBox(width: MediaQuery.of(context).size.width * 0.5),
              InkWell(
                  onTap: () {
                    widget.controller.initialize();
                  },
                  child: Image.asset("assets/image/Asset17@4x.png",
                      height: MediaQuery.of(context).size.height /
                                  MediaQuery.of(context).size.width >
                              1
                          ? MediaQuery.of(context).size.height * 0.07
                          : MediaQuery.of(context).size.height * 0.12)),
            ],
          ),
        ),
      );
       void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChatPage(server: server);
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(
              alignment: Alignment.topCenter, height: 250, child: buildvideo())
          // ignore: sized_box_for_whitespace
          : Container(
              height: 250,
              child: Center(
                child: Lottie.asset("assets/lottie/oading.json"),
              ),
            );
  Widget buildvideo() => Stack(
        children: <Widget>[
          buildvideoPlayer(),
          Positioned.fill(child: BasicOverLayWidget(controller: controller)),
        ],
      );
  Widget buildvideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

class BasicOverLayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const BasicOverLayWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
          ],
        ),
      );
  Widget buildIndicator() =>
      VideoProgressIndicator(controller, allowScrubbing: true);
  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white30,
            size: 28,
          ),
        );
}
