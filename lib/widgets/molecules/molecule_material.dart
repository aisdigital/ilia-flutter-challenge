import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/util/util_route.dart';
import 'package:ilia_challenge/widgets/pages/detail/page_details.dart';

Widget buildMaterialRippleEffect(
    BuildContext context, MoviesModel movieList, int index) {
  return Material(
    color: Colors.white10,
    child: InkWell(
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Colors.white12,
      onLongPress: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(movieList.results![index].title),
            content: Text("Data de lançamento \n" +
                movieList.results![index].releaseDate),
          ),
        );
      },
      onTap: () {
        Navigator.push(
            context,
            CustomRoute(
                settings: RouteSettings(name: "/details"),
                builder: (_) {
                  return PageDetail(movieList.results![index]);
                }));
      },
    ),
  );
}
