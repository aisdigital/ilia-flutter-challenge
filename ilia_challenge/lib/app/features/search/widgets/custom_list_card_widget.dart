import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/features/details/screens/details_screen.dart';
import 'package:ilia_challenge/app/features/search/bloc/search_bloc.dart';
import 'package:ilia_challenge/app/models/movie.dart';

class CustomListCardWidget extends StatefulWidget {
  final List<Movie> movie;
  final SearchBloc searchBloc;

  const CustomListCardWidget(
      {Key? key, required this.movie, required this.searchBloc})
      : super(key: key);

  @override
  State<CustomListCardWidget> createState() => _CustomListCardWidgetState();
}

class _CustomListCardWidgetState extends State<CustomListCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: widget.searchBloc.scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        mainAxisExtent: 250,
      ),
      itemCount: widget.movie.length +
          (widget.searchBloc.state is SearchLoadedMoreMoviesSuccessState
              ? 2
              : 0),
      itemBuilder: (context, index) {
        if (index < widget.movie.length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsScreen(movie: widget.movie[index]),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 300,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 250,
                    width: 100,
                    child: Image.network(
                      '${Constants.imagePath}${widget.movie[index].posterPath}',
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return const CircularProgressIndicator.adaptive();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                            child: Icon(
                          Icons.image_not_supported,
                          color: Colors.white,
                        ));
                      },
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return widget.searchBloc.state is SearchLoadedMoreMoviesSuccessState
              ? const Center(child: CircularProgressIndicator.adaptive())
              : const SizedBox.shrink();
        }
      },
    );
  }
}
