import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ilia_challenge/modules/movie/view/cubit/movie_cubit.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie});
  static String get route => '/movie';

  final Map movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final MovieCubit cubit = MovieCubit();

  late Future movieDetails;

  @override
  void initState() {
    super.initState();
    movieDetails = cubit.movieStarted(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('title'),
      ),
      body: FutureBuilder(
          future: movieDetails,
          builder: (context, snapshot) {
            return Center(
                child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(json.encode('movie')),
              ),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
