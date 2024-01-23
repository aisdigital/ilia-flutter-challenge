import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/features/home/screens/home_screen.dart';

//teste
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page não encontrada.'),
          ),
        ),
      );
  }
}
