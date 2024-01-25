import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/features/search/bloc/search_bloc.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';
import 'package:lottie/lottie.dart';
import '../widgets/custom_list_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> movies;
  TextEditingController searchController = TextEditingController();
  List<Movie> allMovies = [];
  int currentPage = 1;
  late SearchBloc searchBloc = SearchBloc();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc()..add(SearchInitialEvent());
    _scrollController = ScrollController();
    searchBloc.scrollController = _scrollController;
    searchBloc.setupScrollListener(); 
  }

  @override
  void dispose() {
    searchBloc.close();
    super.dispose();
  }

  List<Movie> filterMovies(String query, List<Movie> allMovies) {
    return allMovies
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      bloc: searchBloc,
      listenWhen: (previous, current) => current is SearchActionState,
      buildWhen: (previous, current) => current is! SearchActionState,
      builder: (context, state) {
        return Scaffold(appBar: const DefaultAppBar(), body: _buildBody(state));
      },
    );
  }

  Widget _buildBody(SearchState state) {
    Container(
      color: Colors.pink,
      height: 200,
    );
    if (state is SearchLoadingState) {
      return Center(child: Lottie.asset('assets/lottie.json'));
    } else if (state is SearchLoadedSuccessState) {
      final successState = state;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  searchBloc.add(SearchMovieEvent(query));
                },
                style: const TextStyle(
                    color: Colors.white, fontSize: 16),
                cursorColor: Colors.white, 
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by title',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListCardWidget(
                movie: successState.movies,
                searchBloc: searchBloc,
              ),
            ),
          ),
        ],
      );
    } else if (state is SearchLoadedMoreMoviesSuccessState) {
      final successState = state;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  searchBloc.add(SearchMovieEvent(query));
                },
                style: const TextStyle(
                    color: Colors.white, fontSize: 16), 
                cursorColor: Colors.white, 
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by title',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListCardWidget(
                movie: successState.movies,
                searchBloc: searchBloc,
              ),
            ),
          ),
        ],
      );
    } else if (state is SearchedMovieState) {
      final successState = state;
      final filteredMovies =
          filterMovies(searchController.text, successState.movies);

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  searchBloc.add(SearchMovieEvent(query));
                },
                style: const TextStyle(color: Colors.white, fontSize: 16),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by title',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListCardWidget(
                movie: filteredMovies, 
                searchBloc: searchBloc,
              ),
            ),
          ),
        ],
      );
    } else if (state is SearchErrorState) {
      return const Center(
        child: Text('Erro ao carregar os filmes.'),
      );
    }
    return Container();
  }
}
