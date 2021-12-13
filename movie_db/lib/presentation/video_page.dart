import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatelessWidget {
  const VideoPage(this.youtubeId, {Key? key}) : super(key: key);

  final String youtubeId;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController youtubeController =
        YoutubePlayerController(initialVideoId: youtubeId);

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubeController,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      //4
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }
}
