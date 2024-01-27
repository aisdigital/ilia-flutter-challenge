import 'package:flutter/material.dart';

class IliaFullscreenLoader extends StatelessWidget {
  const IliaFullscreenLoader({
    super.key,
    required this.loading,
    this.color,
  });

  final bool loading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: ColoredBox(
        color: Colors.black54,
        child: SizedBox.fromSize(
          child: Center(
              child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: color ?? Theme.of(context).colorScheme.onBackground)),
        ),
      ),
    );
  }
}
