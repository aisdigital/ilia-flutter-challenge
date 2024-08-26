import 'package:flutter/material.dart';

class HSpacer extends StatelessWidget {
  final double width;
  const HSpacer(
    this.width, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
