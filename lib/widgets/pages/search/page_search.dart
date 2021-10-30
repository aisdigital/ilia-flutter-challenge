import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_card.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_container.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_material.dart';

class SearchPage extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.white,
          primarySwatch: materialWhite,
          brightness: Brightness.dark),
      accentTextTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  void close(BuildContext context, result) {
    super.close(context, result);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<Response?>(
                future: query.isNotEmpty
                    ? streamMovie.getMovieSearchQuery({"searchQuery": query})
                    : streamMovie.listMovieTendency(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.waiting) {
                    var movieList = MoviesModel.fromJson(snapshot.data!.data);

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 8 / 12),
                            itemCount: movieList.results!.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: BuildCardMovie(
                                        movieList.results![index]),
                                  ),
                                  Positioned(
                                    left: 8,
                                    bottom: 8,
                                    child: buildVoteAverage(
                                        movieList.results![index].voteAverage),
                                  ),
                                  Positioned.fill(
                                    child: buildMaterialRippleEffect(
                                        context, movieList, index),
                                  )
                                ],
                              );
                            }),
                      ),
                    );
                  } else {
                    return Center(
                        child: Container(child: CircularProgressIndicator()));
                  }
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Type something and press search on keyboard\nOr search nothing to see movie tendency",
              style: TextStyle(color: secondaryColor, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
