import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:ilia_challenge/modules/movie/view/cubit/movie_cubit.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie});
  static const String route = '/movie';

  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final MovieCubit cubit = MovieCubit();
  final ChallengeCore core = injector.find<ChallengeCore>();
  MediaConfig? get mediaConfig => core.value.mediaConfig;

  @override
  void initState() {
    super.initState();
    // movieDetails = cubit.movieStarted(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.movie.title ?? ''),
      ),
      body: Center(
          child: Column(
        children: [
          if (widget.movie.posterPath != null)
            Builder(builder: (context) {
              const apiBaseUrl = 'https://image.tmdb.org';
              final poster = widget.movie.posterPath!;
              final path = MovieSection.media.path;
              final posterSizes = mediaConfig?.posterSizes ?? [];
              int? middle = posterSizes.length > 2
                  ? (posterSizes.length / 2).ceil()
                  : null;
              final posterSize = middle != null ? posterSizes[middle] : null;

              return CachedNetworkImage(
                  imageUrl: '$apiBaseUrl$path/$posterSizes$poster}');
            }),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.movie.overview ?? ''),
            ),
          ),
        ],
      )),
    );
  }
}
