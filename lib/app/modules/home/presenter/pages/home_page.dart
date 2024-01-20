import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_appbar.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movie_card.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movie_not_found.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_pages_counter.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_search_textfield.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';
import 'package:ilia_flutter_challenge/utils/app_urls.dart';
import 'package:ilia_flutter_challenge/utils/date_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.store});

  final HomeStore store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.store;
  final DateConverter dateConverter = DateConverter();

  @override
  void initState() {
    inicializationApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose;
  }

  Future<void> inicializationApp() async {
    await store.fetchNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IliaflixAppbar(context: context),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  IliaflixSearchTextField(store: store),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.theaters, color: AppColors.lightGrey),
                      const SizedBox(width: 10),
                      const Text(
                        'Filmes que estão em exibição nos cinemas',
                      )
                    ],
                  )
                ],
              ),
            ),
            BlocBuilder<HomeStore, HomeState>(
              bloc: store,
              builder: (context, state) {
                final List<dynamic> moviesList = state.nowPlayingMovies.results;
                final dynamic findMovie = state.findMovie;

                switch (state.state) {
                  case LoadingHomeState():
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: CircularProgressIndicator(
                            color: AppColors.vividRed,
                          ),
                        ),
                      ),
                    );

                  case SuccessHomeState():
                    return SliverList.builder(
                      itemCount: moviesList.length,
                      itemBuilder: (context, index) => IliaflixMovieCard(
                        imageUrl: moviesList[index]['poster_path'] == null
                            ? AppUrls.nullPosterMoviesImage
                            : '${AppUrls.posterMoviesBaseUrl}${moviesList[index]['poster_path']}',
                        movieTitle: moviesList[index]['title'],
                        movieVoteAverage: moviesList[index]['vote_average'],
                        movieReleaseDate: dateConverter
                            .convertionDate(moviesList[index]['release_date']),
                        onTapFunction: () {},
                      ),
                    );

                  case SuccessSearchMovieHomeState():
                    return SliverToBoxAdapter(
                      child: IliaflixMovieCard(
                        imageUrl: findMovie['poster_path'] == null
                            ? AppUrls.nullPosterMoviesImage
                            : '${AppUrls.posterMoviesBaseUrl}${findMovie['poster_path']}',
                        movieTitle: findMovie['title'],
                        movieVoteAverage: findMovie['vote_average'],
                        movieReleaseDate: dateConverter
                            .convertionDate(findMovie['release_date']),
                        onTapFunction: () {},
                      ),
                    );

                  default:
                    return const IliaflixMovieNotFound();
                }
              },
            ),
            IliaflixPagesCounter(store: store),
          ],
        ),
      ),
    );
  }
}
