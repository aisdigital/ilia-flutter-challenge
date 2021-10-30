import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/youtube_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BuildYoutubePlayer extends StatefulWidget {
  final dynamic id;

  BuildYoutubePlayer(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  _BuildYoutubePlayerState createState() => _BuildYoutubePlayerState();
}

class _BuildYoutubePlayerState extends State<BuildYoutubePlayer> {
  BehaviorSubject<bool> _subjectError = BehaviorSubject.seeded(false);

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectError.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          StreamBuilder<bool>(
              initialData: false,
              stream: _subjectError.stream,
              builder: (context, snapshot) {
                if (snapshot.data!) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 8, left: 16, right: 16),
                    child: Text(
                      "Trailer: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  );
                }
              }),
          FutureBuilder(
              future: streamMovie.getMovieVideosById({"movieId": widget.id}),
              builder: (context, AsyncSnapshot<Response?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (snapshot.data != null) {
                    try {
                      MovieYoutubeModel beModel =
                          MovieYoutubeModel.fromJson(snapshot.data!.data!);
                      YoutubePlayerController _controller =
                          YoutubePlayerController(
                        initialVideoId: beModel.results.first.key,
                        flags: YoutubePlayerFlags(
                          useHybridComposition: false,
                          autoPlay: false,
                          mute: false,
                        ),
                      );
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: YoutubePlayer(
                            controller: _controller,
                            liveUIColor: Colors.amber,
                          ),
                        ),
                      );
                    } catch (error) {
                      _subjectError.sink.add(true);
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }
              }),
        ],
      ),
    );
  }
}
