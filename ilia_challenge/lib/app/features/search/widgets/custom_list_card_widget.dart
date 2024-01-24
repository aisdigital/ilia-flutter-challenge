import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/apis.dart';
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
      ),
      itemCount: widget.movie.length,
      itemBuilder: (context, index) {
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
                  height: 200,
                  width: 180,
                  child: Image.network(
                    '${Constants.imagePath}${widget.movie[index].posterPath}',
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
