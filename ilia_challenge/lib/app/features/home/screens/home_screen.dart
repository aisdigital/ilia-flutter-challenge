import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';
import 'package:ilia_challenge/app/features/home/widgets/movies_slider.dart';
import 'package:ilia_challenge/app/features/home/widgets/trending_carousel.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/service/movies_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> nowplayingMovies;
late Future<List<Movie>> popularMovies;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Services().getTrendingMovies();
    nowplayingMovies = Services().getnowPlayingMovies();
    popularMovies = Services().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const DefaultAppBar(
        showBackButton: false,
        showHeartButton: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Em Alta",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Erro ao carregar os filmes"),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Favoritos do público",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Erro ao carregar os filmes"),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Em Cartaz",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: nowplayingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Erro ao carregar os filmes"),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
