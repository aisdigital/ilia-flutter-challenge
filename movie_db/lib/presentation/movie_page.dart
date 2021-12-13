import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/application/movie_page_controller.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/presentation/video_page.dart';

class MoviePage extends StatelessWidget {
  const MoviePage(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      MoviePageController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          'Movie Slasher'.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: movie.backdropPath != null
                ? 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
                : 'https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            errorWidget: (context, url, error) => Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_not_found.png'),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              IconButton(
                icon: const Icon(Icons.youtube_searched_for_rounded),
                onPressed: () async {
                  final trailerVideoKey =
                      await _controller.getTrailerVideoKey(movie.id!);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoPage(
                        trailerVideoKey,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                left: 20,
                top: 40,
                child: Text(
                  movie.title.toString(),
                  style: const TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
