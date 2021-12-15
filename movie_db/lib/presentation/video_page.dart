import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatelessWidget {
  const VideoPage(this.youtubeId, {Key? key}) : super(key: key);

  final String youtubeId;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController youtubeController =
        YoutubePlayerController(initialVideoId: youtubeId);

    return Container(
      color: Colors.black,
      child: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: youtubeController,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.redAccent,
            progressColors: const ProgressBarColors(
              playedColor: Colors.redAccent,
              handleColor: Colors.redAccent,
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
        ),
      ),
    );
  }
}
