import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_catalog/core/constants/constants.dart';
import 'package:movie_catalog/core/theme/app_pallete.dart';
import 'package:movie_catalog/design_system/widgets/widgets.dart';
import 'package:movie_catalog/features/movie_details/presentation/cubit/movie_details_page_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsPage extends StatefulWidget {
  final int id;

  const MovieDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDetailsPageCubit _cubit;
  late YoutubePlayerController _trailerVideoController;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.I.get();
    _cubit.init(widget.id);
  }

  @override
  void dispose() {
    _trailerVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MovieDetailsPageCubit, MovieDetailsPageState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is MovieDetailsPageLoadedState) {
              final genres = state.movieDetails.genres;
              final stateReleaseDate = state.movieDetails.releaseDate;
              final releaseDate = DateTime.tryParse(stateReleaseDate ?? '');
              final movieRuntime = _getMovieRuntime(state.movieDetails.runtime);

              if (state.movieVideosResponse.results.isNotEmpty) {
                _trailerVideoController = YoutubePlayerController(
                  initialVideoId: state.movieVideosResponse.results.first.key,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                )..addListener(_videoPlayerListener);
              } else {
                _trailerVideoController = YoutubePlayerController(
                  initialVideoId: '',
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.chevron_left_outlined,
                        size: 48.0,
                      ),
                    ),
                    if (state.movieVideosResponse.results.isNotEmpty) ...[
                      Center(
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _trailerVideoController,
                          ),
                          builder: (p0, p1) => Center(
                            child: p1,
                          ),
                        ),
                      ),
                    ] else ...[
                      Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          minHeight: MediaQuery.of(context).size.height / 3,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                              '$imageBaseUrl/${state.movieDetails.backdropPath}',
                            ),
                          ),
                        ),
                      ),
                    ],
                    const VSpacer(16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$movieRuntime • Nota: ${state.movieDetails.voteAverage.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: AppPallete.silver,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VSpacer(16.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: genres != null
                            ? genres
                                .map(
                                  (genre) => Container(
                                    padding: const EdgeInsets.all(
                                      8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppPallete.gray,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          32.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      genre.name,
                                      style: TextStyle(
                                        color: AppPallete.white,
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                            : const [],
                      ),
                    ),
                    const VSpacer(16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${state.movieDetails.title} ${releaseDate?.year != null ? '(${releaseDate?.year})' : ''}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VSpacer(16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.movieDetails.overview,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VSpacer(16.0),
                  ],
                ),
              );
            }
            return const Center(
              child: Text(
                'Loading details...',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _videoPlayerListener() {}

  String _getMovieRuntime(int runtime) {
    final durationComponents = Duration(minutes: runtime).toString().split(':');

    return '${durationComponents[0]}h ${durationComponents[1]}min';
  }
}
