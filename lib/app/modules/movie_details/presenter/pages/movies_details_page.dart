import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/store/movie_details_store.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_movie_details_component.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_appbar.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_circular_progress_indicator.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_failure_component.dart';

class MoviesDetailsPage extends StatefulWidget {
  const MoviesDetailsPage({
    super.key,
    required this.movieId,
    required this.store,
  });

  final int movieId;
  final MovieDetailsStore store;

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  int get movieId => widget.movieId;
  MovieDetailsStore get store => widget.store;

  @override
  void initState() {
    inicializationPage(movieId);
    super.initState();
  }

  Future<void> inicializationPage(int movieId) async {
    await store.fetchMovieDetails(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IliaflixAppbar(context: context, isNeededToPop: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<MovieDetailsStore, MovieDetailsState>(
          bloc: store,
          builder: (context, state) {
            final MovieDetails movieDetails = state.movieDetails;

            switch (state.state) {
              case LoadingMovieDetailsState():
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: IliaflixCircularProgressIndicator(),
                  ),
                );

              case SuccessMovieDetailsState():
                return IliaflixMovieDetailsComponent(
                  posterPath: movieDetails.posterPath!,
                  title: movieDetails.title!,
                  voteAverage: movieDetails.voteAverage!.toString(),
                  voteCount: movieDetails.voteCount!.toString(),
                  overview: movieDetails.overview!,
                  genres: movieDetails.genres!,
                );

              default:
                return const IliaflixFailureComponent(
                  failureDescription: 'Erro ao carregar informações!',
                );
            }
          },
        ),
      ),
    );
  }
}
