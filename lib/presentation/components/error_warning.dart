import 'package:flutter/material.dart';

class ErrorWarning extends StatelessWidget {
  final String message;

  const ErrorWarning({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.warning,
            color: Colors.white24,
            size: 64.0,
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white24),
          ),
        ],
      ),
    );
  }
}
