import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_movie_poster.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixMovieDetailsComponent extends StatelessWidget {
  const IliaflixMovieDetailsComponent({
    super.key,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
    required this.genres,
  });

  final String posterPath;
  final String title;
  final String voteAverage;
  final String voteCount;
  final String overview;
  final List<dynamic> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IliaflixMoviePoster(posterPath: posterPath),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(voteAverage),
                ],
              ),
              Text('$voteCount voto(s)'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                overview,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                const Text(
                  'Gêneros:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(width: 5),
                for (int i = 0; i < genres.length; i++)
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: AppColors.vividRed,
                    ),
                    child: Text('${genres[i]['name']}'),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
