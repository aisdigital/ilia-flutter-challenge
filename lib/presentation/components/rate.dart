import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double? value;

  const Rating(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.favorite, color: Colors.red),
        const SizedBox(width: 8.0),
        Text(
          value?.toStringAsFixed(1) ?? '0.0',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
