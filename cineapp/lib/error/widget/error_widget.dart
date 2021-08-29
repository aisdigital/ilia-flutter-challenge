import 'package:cineapp/core/definitions/constraints.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Constraints.paddingNormal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.warning,
              color: Colors.white30,
              size: Constraints.iconSizeLarge,
            ),
            const SizedBox(height: Constraints.spacerNormal),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white30,
              ),
            ),
          ],
        ),
      );
}
