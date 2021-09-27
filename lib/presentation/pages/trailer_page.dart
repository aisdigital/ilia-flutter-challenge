import 'package:ilia_flutter_challenge/controllers/trailer_controller.dart';
import 'package:ilia_flutter_challenge/presentation/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends StatelessWidget {
  const TrailerPage(this.movieId, {Key? key}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      TrailerController(movieId),
      tag: movieId.toString(),
    );

    return Obx(
      () {
        if (_controller.trailerUrl != null) {
          return _controller.obx(
            (state) => TrailerPlayer(_controller.trailerUrl!),
            onLoading:
                const Center(child: CircularProgressIndicator.adaptive()),
            onError: (error) => Text(error.toString()),
          );
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}

class TrailerPlayer extends StatelessWidget {
  const TrailerPlayer(this.trailerUrl, {Key? key}) : super(key: key);
  final String trailerUrl;

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: trailerUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    return Scaffold(
      appBar: HomeAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
            _controller.dispose();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Trailer'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        bottomActions: [
          PlayPauseButton(),
          // FullScreenButton(),
          // RemainingDuration(),
          // CurrentPosition(),
          // PlayPauseButton(),
          // PlaybackSpeedButton(),
          // ProgressBar(),
        ],
        onEnded: (data) => data.toString(),
      ),
    );
  }
}
