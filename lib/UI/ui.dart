import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UI extends StatelessWidget {
  const UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/bluetooth success.json",
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "تم توصيل البلوتوث بنجاح ",
              style: TextStyle(
                  fontFamily: "FF",
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: Color(0xffd753a1)),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   alignment: Alignment.center,
          //   child: Text(
          //     " من فضلك ضع الهاتف في ",
          //     style: TextStyle(
          //         fontFamily: "FF",
          //         fontSize: MediaQuery.of(context).size.height * 0.05,
          //         color: Color(0xffd753a1)),
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   alignment: Alignment.center,
          //   child: Text(
          //     "المكان المخصص له",
          //     style: TextStyle(
          //         fontFamily: "FF",
          //         fontSize: MediaQuery.of(context).size.height * 0.05,
          //         color: Color(0xffd753a1)),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed("/Menu");
                AutoOrientation.portraitUpMode();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.141,
              width: MediaQuery.of(context).size.width * 0.38,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/image/button.png",
                      ),
                      alignment: Alignment.center)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "متابعة",
                    style: TextStyle(
                        fontFamily: "FF",
                        fontSize: MediaQuery.of(context).size.height * 0.06,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}