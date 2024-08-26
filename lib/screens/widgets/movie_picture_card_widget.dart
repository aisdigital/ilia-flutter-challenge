import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/screens/details/details_page.dart';
import 'package:ilia_flutter_challenge/shared/models/movie_model.dart';
import 'package:ilia_flutter_challenge/shared/utils/api_utils.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';

class MoviePictureCardWidget extends StatelessWidget {
  final MovieModel movie;
  const MoviePictureCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsPage(movie: movie))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.grey.shade900,
          child: Image.network(
            ApiUtils.FETCH_IMAGE(movie.poster_path),
            semanticLabel: "${movie.original_title} poster",
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: LinearProgressIndicator(
                      backgroundColor: AppColors.darkScaffoldColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.grey.shade900)),
                );
              }
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
