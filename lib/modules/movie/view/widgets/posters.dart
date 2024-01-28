// import 'package:flutter/material.dart';

// class Posters extends StatelessWidget {
//   const Posters({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       if (widget.movie.posterPath != null)
//         const apiBaseUrl = 'https://image.tmdb.org';
//       final poster = widget.movie.posterPath!;
//       final path = MovieSection.media.path;
//       final posterSizes = mediaConfig?.posterSizes ?? [];
//       final videos = widget.movie.videos;
//       int? middle =
//           posterSizes.length > 2 ? (posterSizes.length / 2).ceil() : null;
//       final posterSize = middle != null ? posterSizes[middle] : null;

//       for (Video element in widget.movie.videos ?? []) {
//         print('element >>> ${element.key}');
//       }

//       final video = videos?.first.key;

//       return video == null ? const SizedBox.shrink() : VideoPlayer(url: video);
//       // return SizedBox();
//     });
//   }
// }
