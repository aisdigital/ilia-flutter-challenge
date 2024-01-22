import 'package:flutter/material.dart';

class IliaflixMovieDetailsTitleSectionComponent extends StatelessWidget {
  const IliaflixMovieDetailsTitleSectionComponent(
      {super.key, required this.sectionName});

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
