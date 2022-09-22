import 'package:flutter/material.dart';

class UI1 extends StatelessWidget {
  const UI1({Key? key}) : super(key: key);

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
                "في عالم الأرقام . . .",
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
                image: AssetImage("assets/image/qwe@4x.png"),
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
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/111@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              " الأرقام 1 _ 2",
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
                              "assets/image/111@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              " الأرقام 3 _ 4",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),  InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/111@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              " الأرقام 5 _ 6",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),  InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/111@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              " الأرقام 7 _ 8",
                              style: TextStyle(
                                  fontFamily: "FF",
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),  InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image/111@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                            ),
                          ),
                          Center(
                            child: Text(
                              " الأرقام 9 _ 10",
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
