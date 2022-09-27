import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  Player({Key? key, VideoPlayerController? controller}) : super(key: key) {
    _controller = controller;
  }

  @override
  State<Player> createState() => _PlayerState();

  VideoPlayerController? _controller;
}

class _PlayerState extends State<Player> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: widget._controller!.value.aspectRatio,
          child: VideoPlayer(widget._controller!),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            children: [
              Container(
                child: Text("Duration: ${widget._controller?.value.duration.toString()}"),
              ),
              Container(
                child: VideoProgressIndicator(
                  widget._controller!,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.blue,
                    bufferedColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.black26,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){
                          widget._controller!.play();
                        },
                        icon: Icon(Icons.play_circle)
                    ),
                    IconButton(
                        onPressed: (){
                          widget._controller!.pause();
                        },
                        icon: Icon(Icons.pause)
                    ),
                    IconButton(
                        onPressed: (){
                          widget._controller!.seekTo(Duration.zero);
                        },
                        icon: Icon(Icons.history)
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
