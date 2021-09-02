import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/const/api_const.dart';
import '../../controller/movie_details_controller.dart';
import '../movie_poster_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/extensions/screen_extension.dart';

class MovieDetailsSuccess extends StatelessWidget {
  MovieDetailsSuccess({Key? key}) : super(key: key);

  final MovieDetailsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: theme.colorScheme.background,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.35,
                child: Image.network(
                  '${ApiConst.imageApiUrl('w500')}${controller.movieDetails!.imagePath}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: size.height * 0.125,
                left: size.width * 0.4,
                child: Material(
                  color: theme.colorScheme.background.withOpacity(.87),
                  borderRadius: BorderRadius.circular(50.scale),
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunch(controller.videoPath)) {
                        launch(controller.videoPath);
                      }
                    },
                    borderRadius: BorderRadius.circular(50.scale),
                    child: Container(
                      width: 80.scale,
                      height: 80.scale,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.scale),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: theme.colorScheme.onBackground,
                          size: 48.scale,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: 12.scale, horizontal: 16.scale),
            child: Text(
              controller.movieDetails!.title,
              style: TextStyle(
                fontSize: 24.scale,
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: 8.scale, horizontal: 16.scale),
            child: Text(
              controller.movieDetails!.overview,
              style: TextStyle(
                fontSize: 16.scale,
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: 8.scale, horizontal: 16.scale),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Similar Movies',
                style: TextStyle(
                  fontSize: 18.scale,
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.similarMovies.length,
              controller: controller.scrollController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.scale),
                  child: MoviePosterCard(
                    movie: controller.similarMovies[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
