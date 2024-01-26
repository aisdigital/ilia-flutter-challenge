import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/adapters/dependency_injector_adapter/auto_injector.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';

late final IntDepInjector injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector = AutoInjectorAdapter()..init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
