import 'package:flutter/material.dart';
import 'package:movie_catalog/core/theme/app_theme.dart';
import 'package:movie_catalog/features/movies_list/presentation/pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Catalog',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
