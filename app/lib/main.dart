import 'package:app/di/injector.dart';
import 'package:app/features/movie/list/movie_list_page.dart';
import 'package:design_system/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjectors();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies List',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
      home: const MovieListPage(),
    );
  }
}
