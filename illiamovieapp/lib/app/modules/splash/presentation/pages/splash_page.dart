import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../../core/presentation/widgets/circular_loader.dart';
import '../../../../core/utils/extensions/brightness_extension.dart';
import '../../../../core/utils/extensions/screen_extension.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.background,
        statusBarBrightness: theme.brightness.opposite,
        statusBarIconBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            color: theme.colorScheme.background,
            padding: EdgeInsets.only(
              top: 160.scale,
              bottom: 32.scale,
            ),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          'assets/logo-ília.svg',
                          width: 50.scale,
                          height: 50.scale,
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/logo-tmdb.svg',
                          width: 50.scale,
                          height: 50.scale,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 64.scale),
                    if (controller.state.isNotFailure)
                      CircularLoader(
                        primaryColor: theme.colorScheme.primary,
                        secondaryColor: theme.colorScheme.secondary,
                      ),
                    if (controller.state.isFailure)
                      Text(
                        '⚠\n${controller.failureMessage}',
                        style: TextStyle(
                          color:
                              theme.colorScheme.onBackground.withOpacity(.87),
                          fontSize: 14.scale,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
