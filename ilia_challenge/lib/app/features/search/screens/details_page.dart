// import 'package:flutter/material.dart';
// import 'package:ilia_challenge/app/constants/apis.dart';
// import 'package:ilia_challenge/app/features/search/screens/home_page.dart';
// import 'package:ilia_challenge/app/models/results.dart';
// import 'package:ilia_challenge/app/models/search_movies_model.dart';


// class DetailsPage extends StatelessWidget {
//   final Movie movie;
//   const DetailsPage({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(movie.title),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .55,
//                 width: MediaQuery.of(context).size.width,
//                 child: Hero(
//                   tag: movie.id,
//                   child: Image.network(
//                     API.REQUEST_IMG(movie.posterPath),
//                     loadingBuilder: (_, child, progress) {
//                       if (progress == null) return child;
//                       return const CircularProgressIndicator.adaptive();
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 movie.overview,
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Icon(Icons.title),
//                   Text(movie.originalTitle),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Icon(Icons.new_releases),
//                   Text(movie.releaseDate),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }