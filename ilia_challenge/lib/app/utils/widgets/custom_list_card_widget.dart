import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/apis.dart';
import 'package:ilia_challenge/app/constants/colors.dart';
import 'package:ilia_challenge/app/features/details/screens/details_screen.dart';
import 'package:ilia_challenge/app/features/search/screens/details_page.dart';
import 'package:ilia_challenge/app/features/search/screens/home_page.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => DetailsScreen(movie: movie),
        //     fullscreenDialog: true,
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Image.network(
                API.REQUEST_IMG(movie.posterPath),
                loadingBuilder: (_, child, progress) {
                  if (progress == null) return child;
                  return const CircularProgressIndicator.adaptive();
                },
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
