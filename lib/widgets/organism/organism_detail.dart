import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/details_model.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/pages/detail/page_controller.dart';

import 'organism_youtube.dart';

Widget buildDetailCover(MoviesResults result) {
  return FutureBuilder(
      future: streamImage.getMovieUrlCover(result.backdropPath ?? ""),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            child: CachedNetworkImage(
              imageUrl: snapshot.data!,
              fit: BoxFit.fitWidth,
            ),
          );
        } else {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}

Widget buildDetailsBody(dynamic id) {
  return StreamBuilder<DetailModel?>(
      stream: streamMovie.details.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  snapshot.data!.title.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.data!.overview.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              StreamBuilder<bool>(
                  initialData: false,
                  stream: controllerDetailPage.isReady.stream,
                  builder: (context, snapshot) {
                    return AnimatedOpacity(
                      opacity: snapshot.data! ? 1 : 0,
                      duration: Duration(seconds: 2),
                      child: Container(
                        child: BuildYoutubePlayer(id),
                        width: MediaQuery.of(context).size.width,
                        // height: 200,
                      ),
                    );
                  }),
            ],
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}
