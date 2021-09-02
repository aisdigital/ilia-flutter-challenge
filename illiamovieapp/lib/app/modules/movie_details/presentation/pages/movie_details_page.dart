import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/domain/enums/control_state_enum.dart';
import '../controller/movie_details_controller.dart';
import '../widgets/movie_details/movie_details_failure.dart';
import '../widgets/movie_details/movie_details_loading.dart';
import '../widgets/movie_details/movie_details_success.dart';

import '../../../../core/utils/extensions/brightness_extension.dart';
import '../../../../core/utils/extensions/screen_extension.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, MovieDetailsController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: theme.brightness.opposite,
        statusBarIconBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          fit: StackFit.expand,
          children: [
            Observer(
              builder: (_) {
                switch (controller.state) {
                  case ControlState.start:
                  case ControlState.loading:
                    return MovieDetailsLoading();
                  case ControlState.sucess:
                    return MovieDetailsSuccess();
                  case ControlState.empty:
                  case ControlState.failure:
                    return MovieDetailsFailure();
                }
              },
            ),
            Positioned(
              top: 16.scale,
              left: 16.scale,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.background.withOpacity(.6),
                  borderRadius: BorderRadius.circular(50.scale),
                ),
                child: IconButton(
                  onPressed: Modular.to.pop,
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: theme.colorScheme.onBackground,
                  ),
                  alignment: Alignment.center,
                  iconSize: 32.scale,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
