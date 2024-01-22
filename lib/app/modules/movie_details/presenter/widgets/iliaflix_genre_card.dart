import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixGenreCard extends StatelessWidget {
  const IliaflixGenreCard({super.key, required this.genreName});

  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.vividRed,
      ),
      child: Text(genreName),
    );
  }
}
