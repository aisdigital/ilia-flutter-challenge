import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/extensions/brightness_extension.dart';
import '../../../../core/utils/extensions/screen_extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.background,
        statusBarBrightness: theme.brightness,
        statusBarIconBrightness: theme.brightness.opposite,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      'assets/logo-ília.svg',
                      width: 150.scale,
                      height: 150.scale,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/logo-tmdb.svg',
                      width: 150.scale,
                      height: 150.scale,
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
