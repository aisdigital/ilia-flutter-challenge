import 'package:flutter/material.dart';
import 'package:movie_db/presentation/home_page.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie Slasher DB',
      home: HomePage(),
    );
  }
}
