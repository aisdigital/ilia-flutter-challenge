import 'package:cineapp/core/definitions/constraints.dart';
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onTap;

  const CardMovie({
    Key? key,
    this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Constraints.borderRadiusSmall),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constraints.borderRadiusSmall),
          image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w220_and_h330_face$imagePath',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
