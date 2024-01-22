import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixCircularProgressIndicator extends StatelessWidget {
  const IliaflixCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.vividRed,
    );
  }
}
