import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/features/search/bloc/search_bloc.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';
import 'package:lottie/lottie.dart';
import '../widgets/custom_list_card_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> movies;
  TextEditingController searchController = TextEditingController();
  List<Movie> allMovies = [];
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  late SearchBloc searchBloc = SearchBloc();

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc()..add(SearchInitialEvent());
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
      listener: (context, state) {
        // TODO: implement listener
      },
      bloc: searchBloc,
      listenWhen: (previous, current) => current is SearchActionState,
      buildWhen: (previous, current) => current is! SearchActionState,
      builder: (context, state) {
        return Scaffold(appBar: const DefaultAppBar(), body: _buildBody(state));
      },
    );
  }

  Widget _buildBody(SearchState state) {
    if (state is SearchLoadingState) {
      return Center(child: Lottie.asset('assets/lottie.json'));
    } else if (state is SearchLoadedSuccessState) {
      final successState = state;
      final filteredMovies = filterMovies(searchController.text, successState.movies);

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  searchBloc.add(SearchMovieEvent(query));                  
                },
                style: const TextStyle(color: Colors.white), // Cor do texto
                cursorColor: Colors.white, // Cor do cursor
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

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  searchBloc.add(SearchMovieEvent(query));                  
                },
                style: const TextStyle(color: Colors.white), // Cor do texto
                cursorColor: Colors.white, // Cor do cursor
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
                movie: state.movies,
                searchBloc: searchBloc,
              ),
            ),
          ),
        ],
      );
    }
    
    else if (state is SearchErrorState) {
      return const Center(
        child: Text('Erro ao carregar os filmes.'),
      );
    }
    return Container();
  }
}
