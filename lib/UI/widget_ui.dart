import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Padding build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/bluetooth on.json",
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "من فضلك قم بتشغيل ",
              style: TextStyle(
                  fontFamily: "FF",
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: Color(0xffd753a1)),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              " البلوتوث لكي تعمل اللعبة ",
              style: TextStyle(
                  fontFamily: "FF",
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: Color(0xffd753a1)),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "بشكل صحيح",
              style: TextStyle(
                  fontFamily: "FF",
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: Color(0xffd753a1)),
            ),
          ),
        ],
      ),
    );
  }
}
