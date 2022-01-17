import 'package:flutter/material.dart';

class ShaderWidget extends StatelessWidget {
  final Widget child;
  ShaderWidget({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        radius: 1.0,
        center: Alignment.topLeft,
        colors: [
          Colors.blue,
          Colors.deepPurpleAccent
        ],
        tileMode: TileMode.mirror
        ).createShader(bounds),
      child: child
    );
  }
}