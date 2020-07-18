import 'package:SarojDance/vidplayer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'vidplayer.dart';

class Videos extends StatefulWidget {
  String link;
  String text;
  String stat;
  Videos(this.link, this.text, this.stat, {Key key}) : super(key: key);
  @override
  _Videos createState() => _Videos(link, text, stat);
}

class _Videos extends State<Videos> {
  VideoPlayerController _control;
  String link = '';
  String text;
  String stat;
  Future<void> _initializeVideoPlayerFuture;

  _Videos(this.link, this.text, this.stat);
  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _control = VideoPlayerController.network(link);
    _initializeVideoPlayerFuture = _control.initialize();
    print('got controller for ' + link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                stat == 'nd') {
              return FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VidPlayer(_control),
                    ),
                  );
                },
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: _control.value.aspectRatio,
                      child: Container(
                        child: VideoPlayer(_control),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.deepPurple[900],
                            fontFamily: 'Orbitron',
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              );
            } else if (stat == 'd') {
              return Text(
                'DELETED VIDEO.',
                style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 20,
                    color: Colors.deepPurple[900]),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _control.dispose();
    super.dispose();
  }
}
