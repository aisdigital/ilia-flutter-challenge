import 'package:flutter/material.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/organism/organism_appbar_stream.dart';
import 'package:ilia_challenge/widgets/pages/home/page_controller.dart';
import 'package:ilia_challenge/widgets/pages/search/page_search.dart';

///HomeAppBar
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    brightness: Brightness.dark,
    title: Text("TheMovieDB"),
    centerTitle: true,
    elevation: 0,
    shadowColor: Colors.black,
    foregroundColor: primaryColor,
    leading: IconButton(
        onPressed: () {
          controllerPage.changeStatus();
        },
        icon: buildStreamFilterIcon()),
    backgroundColor: primaryColor,
    actions: [
      IconButton(
          onPressed: () => {
                showSearch(
                  context: context,
                  delegate: SearchPage(),
                )
              },
          icon: buildStreamSearchIcon()),
    ],
  );
}
