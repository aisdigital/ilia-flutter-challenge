import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pixel_cinema/app/app_module.dart';
import 'package:pixel_cinema/app/app_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppPage(),
    ),
  );
}
