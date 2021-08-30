import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/screen/design_ui.dart';
import 'core/utils/screen/screen_util.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtil.builder(
      designUI: DesignUI.iPhone12Pro,
      designUITablet: DesignUI.iPadPro12dot9,
      builder: (context, constraints, orientation) {
        return MaterialApp(
          title: 'Íllia Movie App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
        ).modular();
      },
    );
  }
}
