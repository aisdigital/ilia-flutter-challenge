import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

import 'widgets/pages/home/page_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.paused:
        break;

      case AppLifecycleState.resumed:
        break;

      case AppLifecycleState.detached:
        streamMovie.dispose();
        dispose();
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      systemNavigationBarColor: primaryColor,
    ));

    return MaterialApp(
        title: 'TheMovieDB', theme: ThemeData.light(), home: HomePage());
  }
}
