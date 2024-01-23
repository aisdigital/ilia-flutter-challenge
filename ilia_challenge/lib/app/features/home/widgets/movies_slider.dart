
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.25,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (context, itemIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Padding( 
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                
                ),
              ),
            ),
          );
        },
        ),
    );
  }
}

