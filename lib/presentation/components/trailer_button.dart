import 'package:flutter/material.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton({
    Key? key,
    required this.movieId,
    required this.onTap,
  }) : super(key: key);

  final int movieId;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Row(
            children: [
              const Icon(Icons.play_arrow),
              const SizedBox(width: 4),
              const Text('Trailer'),
            ],
          ),
        ),
      ),
    );
  }
}
