import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  bool get isDarkMode => (MediaQuery.of(this).platformBrightness == Brightness.dark);

  dynamic toView(Widget view) => Navigator.push(
        this,
        MaterialPageRoute(
          builder: (BuildContext context) => view,
          settings: RouteSettings(name: view.toString()),
        ),
      );
}
