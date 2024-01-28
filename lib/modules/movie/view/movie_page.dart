import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:ilia_challenge/modules/movie/view/cubit/movie_cubit.dart';
import 'package:ilia_challenge/modules/movie/view/widgets/video_player.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  IliaLayout get layout => IliaLayout(context);

  @override
  void initState() {
    super.initState();
    // movieDetails = cubit.movieStarted(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.movie.posterPath == null
            ? Text(widget.movie.title ?? '')
            : null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: CustomScrollView(
        slivers: [
          if (widget.movie.posterPath != null)
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 350,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.movie.title ?? ''),
                background: SizedBox(
                  height: 350,
                  width: layout.width,
                  child: Builder(builder: (context) {
                    const apiBaseUrl = 'https://image.tmdb.org';
                    final poster = widget.movie.posterPath!;
                    final path = MovieSection.media.path;
                    final posterSizes = mediaConfig?.posterSizes ?? [];
                    int? middle = posterSizes.length > 2
                        ? (posterSizes.length / 2).ceil()
                        : null;
                    final posterSize =
                        middle != null ? posterSizes[middle] : null;

                    return CachedNetworkImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        imageUrl: '$apiBaseUrl$path/$posterSize$poster}');
                  }),
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: Center(
                child: ListView(
              shrinkWrap: true,
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
                    final posterSize =
                        middle != null ? posterSizes[middle] : null;

                    print('${widget.movie.videos}');

                    // return VideoPlayer(
                    //     url: Uri.parse('$apiBaseUrl$path/$posterSize$poster}'));
                    return SizedBox();
                  }),
                Text(
                  AppLocalizations.of(context)?.overview ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.overview ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
