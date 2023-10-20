import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'CustomScreen.dart';

class MomentsScreen extends CustomScreen {
  MomentsScreen({required super.imagePath, required super.text});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 50,
            bottom: 190,
          ),
          child: CreateTitle(text),
        ),
        CharacterItem(
          videoPath:
              'assets/gintoki_epic_entrance.mp4', // Replace with your video asset path
          description: 'Entrada epica de Gintoki en medio de una pelea',
        ),
        CharacterItem(
          videoPath:
              'assets/takasugi_death.mp4', // Replace with your video asset path
          description:
              'La muerte de Takasugi, el mejor amigo y enemigo de Gintoki',
        ),
        CharacterItem(
          videoPath:
              'assets/utsuro_fight.mp4', // Replace with your video asset path
          description:
              'Gintoki se da cuenta que su enemigo es la persona que mas admiraba',
        ),
      ],
    );
  }
}

class CharacterItem extends StatefulWidget {
  final String videoPath;
  final String description;

  CharacterItem({
    required this.videoPath,
    required this.description,
  });

  @override
  _CharacterItemState createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {
  bool isExpanded = false;
  late ChewieController _chewieController;
  MomentsScreen _screen = MomentsScreen(
    imagePath: '',
    text: '',
  );

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.asset(widget.videoPath),
      aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
      autoPlay: false, // You can set it to true if you want videos to auto-play
      looping: false, // Set to true if you want videos to loop
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 0,
              bottom: 50,
            ),
            child: _screen.CreateSubtitle(widget.description, 30),
          ),
        ),
        if (isExpanded)
          Column(
            children: <Widget>[
              Chewie(controller: _chewieController),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Impact',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
