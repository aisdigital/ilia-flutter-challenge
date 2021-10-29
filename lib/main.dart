import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

import 'widgets/pages/home/page_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      systemNavigationBarColor: primaryColor,
    ));

    return MaterialApp(
        title: 'TheMovieDB', theme: ThemeData.light(), home: HomePage());
  }
}
