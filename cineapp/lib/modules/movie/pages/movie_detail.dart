import 'package:cineapp/core/definitions/constraints.dart';
import 'package:cineapp/error/widget/error_widget.dart';
import 'package:cineapp/modules/movie/controller/movie_detail_controller.dart';
import 'package:cineapp/modules/movie/models/movie_genre.dart';
import 'package:cineapp/modules/movie/models/spoken_language.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  _searchYoutube(String? path) async {
    final String searchYoutube = path!.replaceAll(" ", "+");
    final youtubeUrl =
        'https://www.youtube.com/results?search_query=$searchYoutube+trailer';
    if (await canLaunch(youtubeUrl)) {
      await launch(youtubeUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _movieDetailWidget(),
    );
  }

  _movieDetailWidget() {
    if (_controller.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_controller.movieError != null) {
      return ErrorMessage(message: _controller.movieError!.message);
    }

    return ListView(
      children: [
        _trailerWidget(),
        _headerWidget(),
        _overviewWidget(),
      ],
    );
  }

  _trailerWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 135.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${_controller.movieDetail!.backdropPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        onPressed: () => _searchYoutube(_controller.movieDetail!.title),
        icon: Icon(
          Icons.play_circle_outline,
          color: Colors.cyan,
          size: Constraints.iconSizeLarge * 3,
        ),
      ),
    );
  }

  _headerWidget() {
    return Padding(
      padding: const EdgeInsets.all(Constraints.paddingNormal),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _controller.movieDetail?.title ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 8.0),
                  Text(
                    _controller.movieDetail?.voteAverage?.toStringAsFixed(1) ??
                        '0.0',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Constraints.spacerSmall),
          Wrap(
            alignment: WrapAlignment.start,
            children: _controller.movieDetail!.genres!
                .map(
                  (MovieGenre genre) => Text(
                    '${genre.name}, ',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white60,
                        ),
                  ),
                )
                .toList()
                .cast<Widget>(),
          ),
          const SizedBox(height: Constraints.spacerSmall),
          Wrap(
            alignment: WrapAlignment.start,
            children: _controller.movieDetail!.spokenLanguages!
                .map(
                  (SpokenLanguageModel spokenLanguages) => Text(
                    '${spokenLanguages.name} ',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white60,
                        ),
                  ),
                )
                .toList()
                .cast<Widget>(),
          ),
          Text(' | ${_controller.movieDetail!.runtime} min '),
        ],
      ),
    );
  }

  _overviewWidget() {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(Constraints.paddingNormal),
        color: Colors.white10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OVERVIEW',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: Constraints.fontSizeNormal,
                  ),
            ),
            const SizedBox(height: Constraints.spacerSmall),
            Text(
              _controller.movieDetail!.overview ?? '',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
