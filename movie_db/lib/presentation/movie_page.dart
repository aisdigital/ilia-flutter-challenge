import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db/application/movie_page_controller.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/presentation/video_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      MoviePageController(
        movie: widget.movie,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 2,
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            widget.movie.title != null
                ? widget.movie.title!.toUpperCase()
                : 'Em Cartaz'.toUpperCase(),
            style: GoogleFonts.baloo(
              color: Colors.redAccent[400],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: widget.movie.backdropPath != null
                ? 'https://image.tmdb.org/t/p/original/${widget.movie.backdropPath}'
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
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0.1,
                        0.9,
                      ],
                          colors: [
                        Colors.transparent,
                        Colors.black
                      ])),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 0.0),
                          child: Text(
                            widget.movie.title != null
                                ? widget.movie.title!
                                : '',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                const Shadow(
                                  color: Colors.white,
                                  blurRadius: 0.1,
                                )
                              ],
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: widget.movie.backdropPath != null
                                  ? 'https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}'
                                  : 'https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1',
                              height: 200,
                              width: MediaQuery.of(context).size.width / 1.10,
                              fit: BoxFit.fitHeight,
                              placeholder: (context, url) => Container(
                                color: Colors.black,
                                height: 200,
                                width: MediaQuery.of(context).size.width / 1.10,
                              ),
                              errorWidget: (context, url, error) => Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/image_not_found.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.movie_creation_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Estréia: ${widget.movie.releaseDate}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Nota: ${widget.movie.voteAverage}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(
                              () => Text(
                                _controller.movieUpdated.value != null
                                    ? (_controller
                                                .movieUpdated.value!.runTime !=
                                            null
                                        ? 'Duração: ${_controller.movieUpdated.value!.runTime} minutos'
                                        : 'Duração: Indisponível')
                                    : 'Duração: Carregando...',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () async {
                            final trailerVideoKey = await _controller
                                .getTrailerVideoKey(widget.movie.id!);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => VideoPage(
                                  trailerVideoKey,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Assitir ao trailler',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.redAccent,
                            ),
                          ),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                  color: Colors.redAccent,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              'Sinopse',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                shadows: [
                                  const Shadow(
                                    color: Colors.white,
                                    blurRadius: 0.1,
                                  )
                                ],
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                widget.movie.overview != null
                                    ? '${widget.movie.overview}'
                                    : 'Indisponível',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.white,
                                      blurRadius: 0.1,
                                    )
                                  ],
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              'Elenco',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                shadows: [
                                  const Shadow(
                                    color: Colors.white,
                                    blurRadius: 0.1,
                                  )
                                ],
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Flexible(
                              child: Obx(
                                () => Text(
                                  _controller.movieUpdated.value != null
                                      ? (_controller.movieUpdated.value!.cast !=
                                              null
                                          ? 'Elenco: ' +
                                              _controller
                                                  .movieUpdated.value!.cast
                                                  .toString()
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', '')
                                          : 'Elenco: Indisponível')
                                      : 'Elenco: Carregando...',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    shadows: [
                                      const Shadow(
                                        color: Colors.white,
                                        blurRadius: 0.1,
                                      )
                                    ],
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MoviePageController>();
    super.dispose();
  }
}
