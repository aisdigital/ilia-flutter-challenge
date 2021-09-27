import 'package:ilia_flutter_challenge/presentation/tabs.dart';
import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeData,
      home: const Tabs(),
    );
  }
}
