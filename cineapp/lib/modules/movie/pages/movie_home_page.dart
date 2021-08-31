import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineapp/core/definitions/constraints.dart';
import 'package:cineapp/error/widget/error_widget.dart';
import 'package:cineapp/modules/movie/controller/movie_controller.dart';
import 'package:cineapp/modules/movie/pages/movie_detail.dart';
import 'package:cineapp/modules/movie/pages/widgets/card_movie.dart';
import 'package:cineapp/modules/movie/pages/widgets/card_movie_top.dart';
import 'package:flutter/material.dart';

class MovieHomePage extends StatefulWidget {
  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final _controller = MovieController();
  final _scrollController = ScrollController();
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    _initScrollListener();
    _initialize();
  }

  _initScrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_controller.currentPage == lastPage) {
          lastPage++;
          await _controller.fetchAllMovies(page: lastPage);
          setState(() {});
        }
      }
    });
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovies(page: lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/6/6e/Tmdb-312x276-logo.png',
          height: 40.0,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _initialize(),
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            _carrousselWidget(),
            _gridWidget(),
          ],
        ),
      ),
    );
  }

  _carrousselWidget() {
    if (_controller.loading) {
      return Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_controller.movieError != null) {
      return ErrorMessage(message: _controller.movieError!.message);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constraints.paddingNormal),
      child: CarouselSlider.builder(
        itemCount: _controller.moviesCount,
        itemBuilder: (BuildContext context, int index, i) {
          final movie = _controller.movies[index];

          return CardMovieTop(
            movie: movie,
            onTap: () => _datailPage(movie.id),
          );
        },
        options: CarouselOptions(
          enableInfiniteScroll: true,
          autoPlay: true,
          height: MediaQuery.of(context).size.height / 4,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: true,
          viewportFraction: 0.95,
          enlargeCenterPage: true,
        ),
      ),
    );
  }

  _gridWidget() {
    if (_controller.loading) {
      return Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_controller.movieError != null) {
      return ErrorMessage(message: _controller.movieError!.message);
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(Constraints.paddingSmall),
      itemCount: _controller.moviesCount,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Constraints.spacerSmall,
        crossAxisSpacing: Constraints.spacerSmall,
        childAspectRatio: 0.65,
      ),
      itemBuilder: _movieCardWidget,
    );
  }

  Widget _movieCardWidget(context, index) {
    final movie = _controller.movies[index];
    return CardMovie(
      imagePath: movie.posterPath,
      onTap: () => _datailPage(movie.id),
    );
  }

  _datailPage(movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId),
      ),
    );
  }
}
