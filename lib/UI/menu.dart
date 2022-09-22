import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

    @override
  void initState() {
    super.initState();
   AutoOrientation.portraitUpMode();

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
                                        MediaQuery.of(context).size.height *
                                            0.03,
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
                    "مرحباً بك",
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
                    "ماذا سنتعلم اليوم؟",
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
                    image: AssetImage("assets/image/Asset.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08),
                    child:   MediaQuery.of(context).size.height / MediaQuery.of(context).size.width > 1 ?Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui1");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset(
                            "assets/image/1@4x.png",
                            height: MediaQuery.of(context).size.height * 0.068,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui2");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/2@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui3");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/3@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui4");

                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/4@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui5");
                            AutoOrientation.portraitUpMode();},
                          child: Image.asset("assets/image/5@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),
                      ],
                    ): Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Row(  crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui1");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset(
                            "assets/image/1@4x.png",
                            height: MediaQuery.of(context).size.height * 0.068,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui2");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/2@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),],
                        ),Row( crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                          
                                           children: [InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui3");
                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/3@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                                  
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui4");

                           AutoOrientation.portraitUpMode();
                          },
                          child: Image.asset("assets/image/4@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),],),Row(  crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/ui5");
                            AutoOrientation.portraitUpMode();},
                          child: Image.asset("assets/image/5@4x.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.068),
                        ),],)]),
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
          )),
    );
  }
}
