import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/colors.dart';
import 'package:ilia_challenge/app/utils/app_routes.dart';
import 'package:ilia_challenge/app/utils/widgets/bottombar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ília Challenge',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colours.backgroundColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            bodySmall: TextStyle(color: Colors.black),
            bodyLarge: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const BottomNavScreen());
  }
}
