import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VidPlayer extends StatefulWidget {
  final VideoPlayerController s;
  VidPlayer(this.s, {Key key}) : super(key: key);
  _VidPlayer createState() => _VidPlayer(this.s);
}

class _VidPlayer extends State<VidPlayer> {
  VideoPlayerController s;
  _VidPlayer(this.s);

  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: s,
    );
  }

  // @override
  // void dispose() {
  //   flickManager.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: FlickVideoPlayer(flickManager: flickManager),
        child: AspectRatio(
          aspectRatio: s.value.aspectRatio,
          child: FlickVideoPlayer(
            flickManager: flickManager,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown
      //     setState(
      //       () {
      //         // If the video is playing, pause it.
      //         if (s.value.isPlaying) {
      //           s.pause();
      //         } else {
      //           // If the video is paused, play it.
      //           s.play();
      //         }
      //       },
      //     );
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     s.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
    );
  }
}
