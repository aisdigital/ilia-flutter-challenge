import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_appbar.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movie_card.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_pages_counter.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_search_textfield.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';
import 'package:ilia_flutter_challenge/utils/app_urls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.store});

  final HomeStore store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.store;

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
      body: FutureBuilder(
        future: inicializationApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.vividRed),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        const IliaflixSearchTextField(),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.theaters, color: AppColors.lightGrey),
                            const SizedBox(width: 10),
                            const Text(
                              'Movies that are currently in theatres',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<HomeStore, HomeState>(
                    bloc: store,
                    builder: (context, state) {
                      final List<dynamic> moviesList =
                          state.nowPlayingMovies.results;
                      return SliverList.builder(
                        itemCount: moviesList.length,
                        itemBuilder: (context, index) => IliaflixMovieCard(
                          imageUrl: moviesList[index]['poster_path'] == null
                              ? AppUrls.nullPosterMoviesImage
                              : '${AppUrls.posterMoviesBaseUrl}${moviesList[index]['poster_path']}',
                          movieTitle: moviesList[index]['original_title'],
                          movieVoteAverage: moviesList[index]['vote_average'],
                          movieReleaseDate: moviesList[index]['release_date'],
                          onTapFunction: () {},
                        ),
                      );
                    },
                  ),
                  IliaflixPagesCounter(store: store),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
