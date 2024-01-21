import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/widgets/iliaflix_movie_card.dart';
import 'package:ilia_flutter_challenge/utils/app_routes.dart';
import 'package:ilia_flutter_challenge/utils/app_urls.dart';
import 'package:ilia_flutter_challenge/utils/date_converter.dart';

class IliaflixMoviesList extends StatelessWidget {
  IliaflixMoviesList({super.key, required this.listItems});

  final List<dynamic> listItems;
  final DateConverter dateConverter = DateConverter();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) => IliaflixMovieCard(
        imageUrl: listItems[index]['poster_path'] == null
            ? AppUrls.nullPosterMoviesImage
            : '${AppUrls.posterMoviesBaseUrl}${listItems[index]['poster_path']}',
        movieTitle: listItems[index]['title'] ?? '',
        movieVoteAverage: listItems[index]['vote_average'] ?? 0.0,
        movieReleaseDate: listItems[index]['release_date'] == null
            ? 'Sem data de lançamento'
            : dateConverter.convertionDate(listItems[index]['release_date']),
        onTapFunction: () => Modular.to.pushNamed(
          AppRoutes.moviesDetailsModuleRoute,
          arguments: listItems[index]['id'],
        ),
      ),
    );
  }
}
