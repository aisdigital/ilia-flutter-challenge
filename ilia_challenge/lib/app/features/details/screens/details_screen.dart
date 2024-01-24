import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/app/features/details/bloc/details_bloc.dart';
import 'package:ilia_challenge/app/features/details/widgets/details_view.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsBloc detailsbloc = DetailsBloc();
  List movieCredits = [];
   List fullMovieDetails = [];
  List movieTrailer = [];
  String trailerYouTubeID = '';
  String genre = '';
  String movieID = '';
  String castImageUrl = '';

  @override
  void initState() {
    super.initState();
    detailsbloc = DetailsBloc()
      ..add(DetailsLoadMovieEvent(clickedMovie: widget.movie));
      print(widget.movie.id);
  }

  @override
  void dispose() {
    detailsbloc.close();
    super.dispose();
  }

  Future<void> _getMovieTrailer() async {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/${widget.movie.id}/videos");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      movieTrailer = data.values.toList()[1];
      for (var trailer in movieTrailer) {
        if (trailer['name'] == 'Official Trailer') {
          setState(() {
            trailerYouTubeID = trailer['key'];
          });
          break;
        }
      }
    } else {
      throw Exception('Failed to load movie videos.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      bloc: detailsbloc,
      listenWhen: (previous, current) => current is DetailsActionState,
      buildWhen: (previous, current) => current is! DetailsActionState,
      builder: (context, state) {
        return Scaffold(body: _buildBody(state));
      },
    );
  }

  Widget _buildBody(DetailsState state) {
    if (state is DetailsLoadingState) {
      return Center(child: Lottie.asset('assets/lottie.json'));
    } else if (state is DetailsLoadedSuccessState) {
      final successState = state;
      return DetailsWidget(
        detailsBloc: detailsbloc,
        movie: successState.movie,
      );
    } else if (state is DetailsErrorState) {
      return const Center(
        child: Text('Erro ao carregar os filmes.'),
      );
    }
    return Container();
  }
}
