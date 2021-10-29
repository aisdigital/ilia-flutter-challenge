import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

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
    return Column(
      children: <Widget>[],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<Response?>(
                future: streamMovie.listMovieUpcomingTheater(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.waiting) {
                    var movieList = MoviesModel.fromJson(snapshot.data!.data);

                    return Expanded(
                      child: GridView.builder(

                          ///without magic numbers, 8 / 12 is the poster proportion inside TheMovieDB.
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 8 / 12),
                          itemCount: movieList.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                Positioned.fill(
                                  child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FutureBuilder<String?>(
                                          builder: (context, snapshot) {
                                            return Ink(
                                              child: CachedNetworkImage(
                                                cacheKey: snapshot.data,
                                                imageUrl: snapshot.data ??
                                                    "https://www.blogson.com.br/wp-content/uploads/2017/10/584b607f5c2ff075429dc0e7b8d142ef.gif",
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                          future: streamImage.getMovieUrlCover(
                                              movieList
                                                  .results![index].posterPath),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  left: 8,
                                  bottom: 8,
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: new BoxDecoration(
                                      color: Colors.black87,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: CircularProgressIndicator(
                                              value: double.parse(movieList
                                                      .results![index]
                                                      .voteAverage
                                                      .toString()) /
                                                  10,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(movieList
                                                        .results![index]
                                                        .voteAverage
                                                        .toString()
                                                        .length <
                                                    3
                                                ? movieList.results![index]
                                                        .voteAverage
                                                        .toString() +
                                                    ".0"
                                                : movieList
                                                    .results![index].voteAverage
                                                    .toString()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.white10,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16.0),
                                      splashColor: Colors.white12,
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
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
}
