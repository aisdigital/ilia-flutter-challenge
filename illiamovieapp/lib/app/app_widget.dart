import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:illiamovieapp/app/app_controller.dart';
import 'package:illiamovieapp/app/app_module.dart';
import 'package:illiamovieapp/app/core/style/movie_app_theme.dart';

import 'core/presentation/widgets/connectivity_banner.dart';
import 'core/utils/screen/design_ui.dart';
import 'core/utils/screen/screen_util.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtil.builder(
      designUI: DesignUI.iPhone12Pro,
      designUITablet: DesignUI.iPadPro12dot9,
      builder: (context, constraints, orientation) {
        return MaterialApp(
          title: 'Íllia Movie App',
          theme: MovieAppTheme.theme,
          initialRoute: AppModule.initialRoute,
          builder: (context, child) {
            return Observer(
              builder: (_) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: controller.isConnected ? 0 : kToolbarHeight / 2.5,
                      ),
                      child: child!,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Observer(
                        builder: (_) {
                          return ConnectivityBanner(
                            isConnected: controller.isConnected,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ).modular();
      },
    );
  }
}
