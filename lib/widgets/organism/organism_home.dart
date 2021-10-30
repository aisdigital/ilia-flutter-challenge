import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_card.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_container.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_material.dart';

StreamBuilder<MoviesModel?> buildStreamBuilderMovies(
    {ScrollController? gridController}) {
  return StreamBuilder<MoviesModel?>(
      stream: streamMovie.movies,
      initialData: streamMovie.movies.value,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          if (snapshot.data != null) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 8 / 12),
                    itemCount: snapshot.data!.results!.length,
                    controller: gridController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child:
                                BuildCardMovie(snapshot.data!.results![index]),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: buildVoteAverage(
                                snapshot.data!.results![index].voteAverage),
                          ),
                          Positioned.fill(
                            child: buildMaterialRippleEffect(
                                context, snapshot.data!, index),
                          )
                        ],
                      );
                    }),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        } else {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}
