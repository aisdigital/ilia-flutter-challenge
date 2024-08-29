import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'utils/app_module.dart';

void main() => runApp(ModularApp(module: AppModule(), child: const MyApp()));


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cinema',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
