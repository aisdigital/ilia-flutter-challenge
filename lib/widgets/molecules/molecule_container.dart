import 'package:flutter/material.dart';
import 'package:ilia_challenge/widgets/atoms/atom_progress.dart';

Widget buildVoteAverage(voteAverage) {
  return Container(
    width: 48,
    height: 48,
    decoration: new BoxDecoration(
      color: Colors.black87,
      shape: BoxShape.circle,
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: buildCircularProgressIndicatorColored(voteAverage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              voteAverage.toString().length < 3
                  ? voteAverage.toString() + ".0"
                  : voteAverage.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
