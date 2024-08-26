import 'package:design_system/widgets/animation/empty_animation.dart';
import 'package:flutter/material.dart';

class NotFoundWarning extends StatelessWidget {
  final String message;

  const NotFoundWarning({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(width: 300, height: 300, child: IliaMoviesAnimations.emptyAnim),
          Text(message),
        ],
      ),
    );
  }
}
