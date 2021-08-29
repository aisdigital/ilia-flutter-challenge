import 'package:cineapp/core/resources/theme.dart';
import 'package:cineapp/modules/movie/pages/movie_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.themeData,
      home: MovieHomePage(),
    );
  }
}
