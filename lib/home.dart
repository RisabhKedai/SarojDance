import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'loginwin.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
      () {
        final assetsAudioPlayer = AssetsAudioPlayer();
        assetsAudioPlayer.open(
          Audio("sounds/opensound.wav"),
        );
      },
    );
    Timer(
      Duration(seconds: 7),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginWin()));
      },
    );
    FlutterStatusbarcolor.setStatusBarColor(
      Colors.deepPurple[900],
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Text(
                  'Saroj',
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontWeight: FontWeight.w700,
                    fontSize: 60,
                    color: Colors.deepPurple[900],
                  ),
                ),
                Image(
                  image: AssetImage('images/docodance.png'),
                  width: 260,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Brought to you by:-',
                  style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image(
                    image: AssetImage('images/docogen.jfif'),
                    width: 420,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
