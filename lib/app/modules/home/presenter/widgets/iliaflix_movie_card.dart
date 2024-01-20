import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixMovieCard extends StatelessWidget {
  const IliaflixMovieCard({
    super.key,
    required this.imageUrl,
    required this.movieTitle,
    required this.movieVoteAverage,
    required this.movieReleaseDate,
    required this.onTapFunction,
  });

  final String imageUrl;
  final String movieTitle;
  final double movieVoteAverage;
  final String movieReleaseDate;
  final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: SizedBox(
                  width: 120,
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      movieTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        movieVoteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Released on: $movieReleaseDate',
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
