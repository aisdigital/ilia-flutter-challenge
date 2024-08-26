import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Widget child;
  const Tag({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
