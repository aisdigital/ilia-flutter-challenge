import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/movie_model.dart';
import '../../../utils/language_helper.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              NumberFormat('#.0').format(movie.voteAverage),
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelLarge,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Score',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              LanguageHelper.getLanguage(movie.originalLanguage),
              softWrap: true,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelLarge,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Language',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
