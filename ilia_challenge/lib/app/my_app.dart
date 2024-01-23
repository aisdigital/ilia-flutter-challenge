import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/colors.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/features/home/screens/home_screen.dart';
import 'package:ilia_challenge/app/utils/routes.dart';

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
          textTheme: TextTheme(
            bodySmall: TextStyle(color: Colors.black),
            bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500), // Para textos normais
            bodyMedium:
                TextStyle(color: Colors.black87), // Para textos secundários
            // Adicione mais estilos conforme necessário
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const HomeScreen());
  }
}
