import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/app/features/details/bloc/details_bloc.dart';
import 'package:ilia_challenge/app/features/details/widgets/details_view.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:lottie/lottie.dart';

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
  }

  @override
  void dispose() {
    detailsbloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      listener: (context, state) {},
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
