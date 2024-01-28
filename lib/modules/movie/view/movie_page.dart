import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/modules/movie/view/cubit/movie_cubit.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie});
  static const String route = '/movie';

  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final MovieCubit cubit = MovieCubit();
  @override
  void initState() {
    super.initState();
    // movieDetails = cubit.movieStarted(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.movie.title ?? ''),
      ),
      body: Center(
          child: Column(
        children: [
          // if (widget.movie.posterPath != null)
          //   Image.network(widget.movie.posterPath!),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.movie.overview ?? ''),
            ),
          ),
        ],
      )),
    );
  }
}
