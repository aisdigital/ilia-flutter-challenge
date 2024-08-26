import 'package:app/features/movie/list/movie_list_controller.dart';
import 'package:core/core.dart';
import 'package:core/util/debouncer.dart';
import 'package:design_system/widgets/common/not_found.dart';
import 'package:design_system/widgets/shimmer/movie_list_shimmer.dart';
import 'package:design_system/widgets/tiles/now_playing_grid_tile.dart';
import 'package:design_system/widgets/tiles/now_playing_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:service/movie/entities/movie_entity.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _movieListController = MovieListController();
  final _scrollController = ScrollController();

  final _searchTec = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 20) {
      if (!_movieListController.state.pageLoading) {
        if (_searchTec.text.isEmpty) {
          _movieListController.fetchMovies(loadMore: true);
        } else {
          _movieListController.searchMovies(_searchTec.text, loadMore: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Ília Movies List'),
        actions: [
          IconButton(
            onPressed: () => setState(() => _movieListController.changeListType()),
            icon: Icon(_movieListController.state.listType == MovieListType.list ? Icons.grid_view : Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                controller: _searchTec,
                decoration: InputDecoration(
                  hintText: 'Search for movies...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchTec.text = '';
                      _movieListController.fetchMovies();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onSubmitted: (query) {
                  _searchTec.text = query;
                  _movieListController.searchMovies(query);
                },
                onChanged: (query) {
                  if (query.isEmpty) {
                    _movieListController.fetchMovies();
                    return;
                  }

                  _debouncer.run(() => _movieListController.searchMovies(query));
                },
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _movieListController,
                builder: (context, state, child) {
                  if (state.isLoading) return MovieListShimmer();

                  if (state.exception != null) return Center(child: Text(state.exception!.message));

                  if (state.data?.isEmpty ?? true) return NotFoundWarning(message: 'No movies found');

                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 26),
                        Text(
                          _searchTec.text.isEmpty ? 'Now Playing' : 'Search Results',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 16),
                        AnimatedSwitcher(
                          duration: Durations.long3,
                          child: state.listType == MovieListType.list
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final MovieEntity movie = state.data![index];

                                    return NowPlayingMovieListTile(
                                      onTap: () => _movieListController.onMovieTap(movie.id, context),
                                      title: movie.title,
                                      rating: movie.voteAverage.toStringAsFixed(2),
                                      posterPath: movie.posterPath,
                                      overview: movie.overview,
                                      releaseDate: movie.releaseDate?.isEmpty ?? true
                                          ? ''
                                          : DateFormat.yMMMd().format(
                                              DateTime.parse(movie.releaseDate ?? ""),
                                            ),
                                    );
                                  },
                                )
                              : GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: .58,
                                  ),
                                  itemCount: state.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final MovieEntity movie = state.data![index];

                                    return Hero(
                                      tag: movie.posterPath ?? "",
                                      child: NowPlayingGridTile(
                                        onTap: () => _movieListController.onMovieTap(movie.id, context),
                                        title: movie.title,
                                        rating: movie.voteAverage.toStringAsFixed(2),
                                        posterPath: movie.posterPath,
                                        overview: movie.overview,
                                      ),
                                    );
                                  },
                                ),
                        ),
                        if (_movieListController.state.pageLoading && state.hasMore)
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
