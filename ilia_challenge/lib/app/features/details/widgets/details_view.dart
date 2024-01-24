import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ilia_challenge/app/features/details/bloc/details_bloc.dart';
import 'package:ilia_challenge/app/service/trailer_movies.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/movie.dart';
import '../../home/widgets/back_button.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget(
      {super.key, required this.detailsBloc, required this.movie});
  final DetailsBloc detailsBloc;
  final Movie movie;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late YoutubePlayerController _controller;
  String trailerYouTubeID = '';
  List movieTrailer = [];

  @override
  void initState() {
    super.initState();
    _loadMovieTrailer();
  }

  Future<void> _loadMovieTrailer() async {
    try {
      trailerYouTubeID = await TrailerMovies().getMovieTrailer(
        movieTrailer,
        trailerYouTubeID,
        widget.movie.id.toString(),
      );
      setState(() {
        trailerYouTubeID = trailerYouTubeID;
      });
    } catch (error) {
      print('Error loading movie trailer: $error');
      // Trate o erro conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const BackBtn(),
          backgroundColor: Colours.backgroundColor,
          expandedHeight: 300,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                
                  },
                '${Constants.imagePath}${widget.movie.posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (trailerYouTubeID == '') {
                      const snackBar = SnackBar(
                        content: Text('Movie trailer not available'),
                        backgroundColor: CupertinoColors.systemOrange,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      showMovieTrailerDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                    side: const BorderSide(
                      width: 2,
                      color: CupertinoColors.systemOrange,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Watch Trailer',
                    style: TextStyle(
                        color: CupertinoColors.systemOrange,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.movie.overview,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoContainer(
                        'Release Date', widget.movie.releaseDate),
                    _buildInfoContainer(
                      'Rating',
                      '${widget.movie.voteAverage.toStringAsFixed(1)}/10',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showMovieTrailerDialog(BuildContext context) {
    var videoUrl = "https://www.youtube.com/watch?v=${trailerYouTubeID}";
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          content: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.orange,
                  handleColor: Colors.orangeAccent,
                ),
              ),
              const PlaybackSpeedButton(),
              FullScreenButton(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget _buildInfoContainer(String label, String value) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
