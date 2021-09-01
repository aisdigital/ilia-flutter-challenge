import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../controller/home_controller.dart';
import '../../../../../core/utils/extensions/screen_extension.dart';

class HomePageFailure extends StatefulWidget {
  const HomePageFailure({Key? key}) : super(key: key);

  @override
  _HomePageFailureState createState() => _HomePageFailureState();
}

class _HomePageFailureState
    extends ModularState<HomePageFailure, HomeController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
        color: theme.colorScheme.background,
        padding: EdgeInsets.symmetric(horizontal: 24.scale),
        child: Center(
          child: Text(
            controller.stateMessage,
            style: TextStyle(
              color: theme.colorScheme.onBackground.withOpacity(.87),
              fontSize: 18.scale,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
