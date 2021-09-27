import 'package:ilia_flutter_challenge/controllers/search_controller.dart';
import 'package:ilia_flutter_challenge/presentation/components/error_warning.dart';
import 'package:ilia_flutter_challenge/presentation/components/home_app_bar.dart';
import 'package:ilia_flutter_challenge/presentation/components/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _focusNode = FocusNode();
  final _controller = Get.put(SearchController());

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_controller.onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_controller.onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: Text(
          'Search',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Search your favorite movies...',
                    ),
                    onSubmitted: (searchTerm) {
                      if (searchTerm == '') {
                        _focusNode.requestFocus();
                      } else {
                        _controller.searchMovie(searchTerm);
                      }
                    },
                  ),
                ),
                Obx(
                  () => AnimatedCrossFade(
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 250),
                    firstChild: TextButton(
                      onPressed: () => _focusNode.unfocus(),
                      child: const Text('Cancelar'),
                    ),
                    secondChild: const SizedBox(),
                    crossFadeState: _controller.showCancel.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
              ],
            ),
          ),
          Flexible(child: _buildMovieGrid()),
        ],
      ),
    );
  }

  _buildMovieGrid() {
    return _controller.obx(
      (state) {
        if (_controller.movies.isEmpty) {
          return const Center(
            child: Text(
              'Ops, não encontramos \nnenhum filme com esse nome!',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
          );
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _controller.moviesCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            itemBuilder: _buildMovieCard,
          );
        }
      },
      onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      onError: (error) => ErrorWarning(message: error.toString()),
      onEmpty: Container(),
    );
  }

  Widget _buildMovieCard(context, index) {
    final movie = _controller.movies[index];
    return MovieCard(
      movieId: movie.id.toString(),
      posterPath: movie.posterPath,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            movie.id!,
          ),
        ),
      ),
    );
  }
}
