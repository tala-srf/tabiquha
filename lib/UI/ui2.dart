import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';

class UI2 extends StatefulWidget {
  const UI2({Key? key}) : super(key: key);

  @override
  State<UI2> createState() => _UI2State();
}

class _UI2State extends State<UI2> {
      @override
  void initState() {
    super.initState();
   AutoOrientation.portraitUpMode();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/asdf.png"),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.5),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.topCenter,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green.shade500,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "متصل بالبلوتوث",
                            style: TextStyle(
                                fontFamily: "FF",
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text(
                "أهلاً بك",
                style: TextStyle(
                    fontFamily: "FF",
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text(
                "مع الحروف العربية . . .",
                style: TextStyle(
                    fontFamily: "LL",
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.white),
              ),
            ),
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.63,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/zzz@4x.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              )),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/vv");
                              AutoOrientation.fullAutoMode();
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/222@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              "حرف الألف ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/222@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              "حرف الباء ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/222@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              "حرف التاء ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/222@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              "حرف الثاء ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/222@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              "حرف الجيم ",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                "assets/image/wordmark.png",
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
