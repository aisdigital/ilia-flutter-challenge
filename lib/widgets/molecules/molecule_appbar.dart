import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/pages/search/page_search.dart';

///HomeAppBar
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    brightness: Brightness.dark,
    title: SvgPicture.asset(
      "assets/icons/logo.svg",
      width: MediaQuery.of(context).size.width / 2,
      fit: BoxFit.cover,
    ),
    centerTitle: true,
    elevation: 0,
    shadowColor: Colors.black,
    foregroundColor: primaryColor,
    backgroundColor: primaryColor,
    actions: [
      IconButton(
          onPressed: () => {
                showSearch(
                  context: context,
                  delegate: SearchPage(),
                )
              },
          icon: Icon(Icons.search)),
    ],
  );
}
