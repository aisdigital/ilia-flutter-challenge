import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixWatchVideoButton extends StatelessWidget {
  const IliaflixWatchVideoButton(
      {super.key, required this.onTapWatchVideoButton});

  final VoidCallback onTapWatchVideoButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapWatchVideoButton,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2.5,
        height: 40,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.vividRed,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow),
              SizedBox(width: 5),
              Text('ASSISTIR'),
            ],
          ),
        ),
      ),
    );
  }
}
