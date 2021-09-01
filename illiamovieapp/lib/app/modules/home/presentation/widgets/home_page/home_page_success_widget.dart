import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/const/api_const.dart';
import '../../../../../core/utils/extensions/screen_extension.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../controller/home_controller.dart';

class HomePageSuccess extends StatefulWidget {
  const HomePageSuccess({Key? key}) : super(key: key);

  @override
  _HomePageSuccessState createState() => _HomePageSuccessState();
}

class _HomePageSuccessState
    extends ModularState<HomePageSuccess, HomeController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (_) {
        return Container(
          color: theme.colorScheme.background,
          padding: EdgeInsets.symmetric(horizontal: 24.scale),
          child: ListView.builder(
            itemCount: controller.movies.length,
            controller: controller.scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.scale),
                child: _ItemMovie(
                  controller: controller,
                  movie: controller.movies[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ItemMovie extends StatelessWidget {
  const _ItemMovie({
    Key? key,
    required this.controller,
    required this.movie,
  }) : super(key: key);

  final HomeController controller;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.scale),
      ),
      child: InkWell(
        onTap: () => controller.handleTapMovie(movieId: movie.movieId),
        borderRadius: BorderRadius.circular(8.scale),
        child: Padding(
          padding: EdgeInsets.all(12.scale),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.scale),
                child: Container(
                  width: 70.scale,
                  height: 106.scale,
                  child: Image.network(
                    '${ApiConst.imageApiUrl('w200')}${movie.moviePoster}',
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 32.scale,
              ),
              Container(
                width: 130.scale,
                height: 106.scale,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.colorScheme.onBackground,
                        fontSize: 18.scale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: theme.colorScheme.onBackground.withOpacity(.6),
                        ),
                        SizedBox(
                          width: 8.scale,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            movie.releaseDateFormatted,
                            style: TextStyle(
                              color: theme.colorScheme.onBackground
                                  .withOpacity(.6),
                              fontSize: 12.scale,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(
                  24.scale,
                  -39.scale,
                ),
                child: Container(
                  width: 32.scale,
                  height: 50.scale,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        8.scale,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: theme.colorScheme.onPrimary,
                      ),
                      Text(
                        '${movie.rating}',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
