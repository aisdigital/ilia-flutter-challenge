import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/movie_model.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              '9.5',
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
              'English',
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
