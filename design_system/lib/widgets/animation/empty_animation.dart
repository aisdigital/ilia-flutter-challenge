import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IliaMoviesAnimations {
  static const String _packageName = 'design_system';

  static FutureBuilder _lottieBuilder(AssetLottie assetLottie) {
    return FutureBuilder<LottieComposition>(
      future: assetLottie.load(),
      builder: (_, snapshot) {
        final composition = snapshot.data;

        if (composition == null) {
          return const SizedBox.shrink();
        }

        return Lottie(
          composition: composition,
          repeat: true,
        );
      },
    );
  }

  static final emptyAnim = _lottieBuilder(
    AssetLottie(
      'assets/lotties/empty.json',
      package: _packageName,
    ),
  );
}
