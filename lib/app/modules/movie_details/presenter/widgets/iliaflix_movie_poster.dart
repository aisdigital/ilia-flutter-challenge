import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_urls.dart';

class IliaflixMoviePoster extends StatelessWidget {
  const IliaflixMoviePoster({super.key, required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: SizedBox(
          width: 180,
          height: 250,
          child: Image.network(
            posterPath == ''
                ? AppUrls.nullPosterMoviesImage
                : '${AppUrls.posterMoviesBaseUrl}$posterPath',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
