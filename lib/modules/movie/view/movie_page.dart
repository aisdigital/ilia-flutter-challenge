import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';
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
  final MovieCubit _cubit = MovieCubit();
  final ChallengeCore _core = injector.find<ChallengeCore>();
  MediaConfig? get _mediaConfig => _core.value.mediaConfig;
  IliaLayout get _layout => IliaLayout(context);

  late final Map<String, List> _gallery;
  late final List _backdrops;
  late final List _logos;
  late final List _posters;

  @override
  void initState() {
    super.initState();
    _gallery = _cubit.handleMoviePostersLinks(
        images: widget.movie.images, config: _mediaConfig);

    _backdrops = _gallery['backdrops'] ?? [];
    _logos = _gallery['logos'] ?? [];
    _posters = _gallery['posters'] ?? [];

    _backdrops.shuffle();
    _logos.shuffle();
    _posters.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
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
                width: _layout.width,
                child: Builder(builder: (context) {
                  final String? backdrop =
                      _backdrops.isNotEmpty ? _backdrops.first : null;

                  final String? poster =
                      _posters.isNotEmpty ? _posters.first : null;

                  final String url = backdrop ?? poster ?? '';

                  return url.isNotEmpty
                      ? CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/nobanner.jpeg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          imageUrl: url)
                      : Image.asset('assets/images/nobanner.jpeg');
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
                GalleryGrid(gallery: _backdrops),
                const SizedBox(height: 10),
                GalleryGrid(gallery: _posters),
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
                  final List<String> videos = _cubit
                      .handleMovieVideoLinks(widget.movie.videos ?? <Video>[]);

                  final String? video = videos.isEmpty ? null : videos.first;

                  return video == null
                      ? const SizedBox.shrink()
                      : VideoPlayer(url: video);
                  // return SizedBox();
                }),
                const SizedBox(height: 80),
                if (_logos.isNotEmpty)
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: _layout.width * .25),
                      constraints: BoxConstraints(
                        maxHeight: _layout.width * .5,
                        maxWidth: _layout.width * .5,
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        imageUrl: _logos.first,
                      )),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
