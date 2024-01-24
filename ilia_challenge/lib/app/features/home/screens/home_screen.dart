import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/app/features/details/screens/details_screen.dart';
import 'package:ilia_challenge/app/features/home/bloc/home_bloc.dart';
import 'package:ilia_challenge/app/features/home/widgets/movies_slider.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';
import 'package:ilia_challenge/app/features/home/widgets/trending_carousel.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc()..add(HomeInitialEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigatetoDetailsState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  movie: (state as HomeNavigatetoDetailsState).clickedMovie,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const DefaultAppBar(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildBody(state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    if (state is HomeLoadingState) {
      return Center(child: Lottie.asset('assets/lottie.json'));
    } else if (state is HomeLoadedSuccessState) {
      final successState = state;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          TrendingSlider(
              movies: successState.trendingMovies, homeBloc: homeBloc),
          Text(
            "Favorites",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          MoviesSlider(movies: successState.popularMovies, homeBloc: homeBloc),
          Text(
            "Now Playing",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          MoviesSlider(
              homeBloc: homeBloc, movies: successState.nowplayingMovies)
        ],
      );
    } else if (state is HomeErrorState) {
      return const Center(
        child: Text('Erro ao carregar os filmes.'),
      );
    }
    return Container();
  }
}
