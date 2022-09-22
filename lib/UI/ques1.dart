import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice server;

  const ChatPage({required this.server});

  @override
  _ChatPage createState() => new _ChatPage();
}

class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class _ChatPage extends State<ChatPage> {
  int count = 0;
  late Timer timer;
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  //String audioasset = "assets/audio/1.m4a";
  bool isplaying = false;
  bool audioplayed = false;
  List<String> voice = ["assets/audio/q1.aac", "assets/audio/q2.aac"];
  //List<String> send = ["CAT","DOG"];

  AudioPlayer player = AudioPlayer();
  static final clientID = 0;
  BluetoothConnection? connection;

  List<_Message> messages = List<_Message>.empty(growable: true);
  String _messageBuffer = '';

  // final TextEditingController textEditingController =
  //     new TextEditingController();
  // final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes = await rootBundle.load(voice[0]);
      Uint8List audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //isConnected ? () => _sendMessage("CAT") : null;
      isConnected ? () => player.playBytes(audiobytes) : null;
    });

    super.initState();
          AutoOrientation.fullAutoMode();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection!.input!.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serverName = widget.server.name ?? "Unknown";
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff9374c2),
            title: (isConnecting
                ? Text(' جار الاتصال مع ' + serverName)
                : isConnected
                    ? Text('تم الاتصال مع  ' + serverName,
                        style: TextStyle(color: Color(0xff17e3d2)))
                    : Text('Chat log with ' + serverName))),
        body: Container(
        
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/ques.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
          child: count==0? Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
                  onTap: isConnected
                      ? () async {
                          ByteData bytes = await rootBundle.load(voice[0]);
                          Uint8List audiobytes = bytes.buffer.asUint8List(
                              bytes.offsetInBytes, bytes.lengthInBytes);
                          player.playBytes(audiobytes);
                          _sendMessage("CAT");
                        }
                      : null,
                  child: Image.asset(
                    "assets/image/Asse19@4x.png",
                    height: 150,
                  )),
          ):Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
                  onTap: isConnected
                      ? () async {
                          ByteData bytes = await rootBundle.load(voice[1]);
                          Uint8List audiobytes = bytes.buffer.asUint8List(
                              bytes.offsetInBytes, bytes.lengthInBytes);
                          player.playBytes(audiobytes);
                          _sendMessage("DOG");
                        }
                      : null,
                  child: Image.asset(
                    "assets/image/Asse19@4x.png",
                    height: 150,
                  )),
          ),
          ),
        );
  }

  _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data

    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      setState(() {
        messages.add(
          _Message(
            1,
            backspacesCounter > 0
                ? _messageBuffer.substring(
                    0, _messageBuffer.length - backspacesCounter)
                : _messageBuffer + dataString.substring(0, index),
          ),
        );
        _messageBuffer = dataString.substring(index);
      });
    } else {
      if (dataString == "t") {
        if(count ==0){Navigator.of(context).pushNamed("/yes");}
        if(count == 1){Navigator.of(context).pushNamed("/yesend");}
        
        setState(() {
          count += 1;
        });
      } else if (dataString == "f") {
        Navigator.of(context).pushNamed("/no");
      }
      // _messageBuffer = (backspacesCounter > 0
      //     ? _messageBuffer.substring(
      //         0, _messageBuffer.length - backspacesCounter)
      //     : _messageBuffer + dataString);
    }
  }

  void _sendMessage(String text) async {
    // text = text.trim();
    //textEditingController.clear();

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        // Future.delayed(Duration(milliseconds: 333)).then((_) {
        //   listScrollController.animateTo(
        //       listScrollController.position.maxScrollExtent,
        //       duration: Duration(milliseconds: 333),
        //       curve: Curves.easeOut);
        // });
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
