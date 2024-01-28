import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:ilia_challenge/modules/movie/view/cubit/movie_cubit.dart';
import 'package:ilia_challenge/modules/movie/view/widgets/gallery_grid.dart';
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

  late final Map<String, List> gallery;
  late final List backdrops;
  late final List logos;
  late final List posters;

  @override
  void initState() {
    super.initState();
    gallery = cubit.handleMoviePostersLinks(
        images: widget.movie.images, config: mediaConfig);

    backdrops = gallery['backdrops'] ?? [];
    logos = gallery['logos'] ?? [];
    posters = gallery['posters'] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (widget.movie.posterPath != null)
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 350,
              backgroundColor: Theme.of(context).colorScheme.background,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.movie.title ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    AppLocalizations.of(context)?.overview ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    widget.movie.overview ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    AppLocalizations.of(context)?.gallery ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                GalleryGrid(gallery: backdrops),
                const SizedBox(height: 10),
                GalleryGrid(gallery: posters),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Trailler',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Builder(builder: (context) {
                  final List<String> videos = cubit
                      .handleMovieVideoLinks(widget.movie.videos ?? <Video>[]);

                  final String? video = videos.isEmpty ? null : videos.first;

                  return video == null
                      ? const SizedBox.shrink()
                      : VideoPlayer(url: video);
                  // return SizedBox();
                }),
                const SizedBox(height: 80),
                if (logos.isNotEmpty)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: layout.width * .25),
                    constraints: BoxConstraints(
                      maxHeight: layout.width * .5,
                      maxWidth: layout.width * .5,
                    ),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        imageUrl: logos.first),
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
