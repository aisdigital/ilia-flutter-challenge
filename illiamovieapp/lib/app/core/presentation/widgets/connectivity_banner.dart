import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/extensions/brightness_extension.dart';
import '../../utils/extensions/screen_extension.dart';

const int kAnimationInternetBannerDuration = 500;
const double kConnectivityBannerHeight = kToolbarHeight + 20;

class ConnectivityBanner extends StatefulWidget {
  final bool isConnected;

  const ConnectivityBanner({
    Key? key,
    required this.isConnected,
  }) : super(key: key);

  @override
  _ConnectivityBannerState createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<ConnectivityBanner> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: !widget.isConnected
          ? SystemUiOverlayStyle(
              statusBarBrightness: theme.brightness.opposite,
              statusBarIconBrightness: theme.brightness,
              statusBarColor: theme.colorScheme.error,
            )
          : SystemUiOverlayStyle(),
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: widget.isConnected ? 0 : kConnectivityBannerHeight,
        color: theme.colorScheme.error,
        alignment: Alignment.center,
        curve: Curves.easeInOutCubic,
        duration: Duration(
          milliseconds: kAnimationInternetBannerDuration,
        ),
        child: Center(
          child: Text(
            'Sem conexão com a internet...',
            style: theme.textTheme.subtitle2!.merge(TextStyle(
              color: theme.colorScheme.onError,
              fontWeight: FontWeight.w600,
              height: 4.scale,
            )),
          ),
        ),
      ),
    );
  }
}
