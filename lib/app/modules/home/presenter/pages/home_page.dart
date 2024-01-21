import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movies_list.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_appbar.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_loading_home_element.dart.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movie_not_found.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_pages_counter.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_search_textfield.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  IliaflixSearchTextField(store: store),
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
                final List<dynamic> findMoviesList = state.findMoviesList;

                switch (state.state) {
                  case LoadingHomeState():
                    return const IliaflixLoadingHomeElement();

                  case LoadingSearchMovieHomeState():
                    return IliaflixLoadingHomeElement(
                      isSearch: true,
                      currentSearchPage: state.currentSearchPage.toString(),
                      totalPages: state.nowPlayingMovies.totalPages.toString(),
                    );

                  case SuccessHomeState():
                    return IliaflixMoviesList(listItems: moviesList);

                  case SuccessSearchMovieHomeState():
                    return IliaflixMoviesList(listItems: findMoviesList);

                  default:
                    return const IliaflixMovieNotFound();
                }
              },
            ),
            BlocBuilder<HomeStore, HomeState>(
              bloc: store,
              builder: (context, state) {
                return state.pageCounterIsActive
                    ? IliaflixPagesCounter(store: store)
                    : const SliverToBoxAdapter();
              },
            )
          ],
        ),
      ),
    );
  }
}
