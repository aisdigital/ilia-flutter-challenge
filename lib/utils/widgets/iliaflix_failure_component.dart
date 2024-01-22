import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixFailureComponent extends StatelessWidget {
  const IliaflixFailureComponent({super.key, required this.failureDescription});

  final String failureDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.vividRed,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Center(child: Text(failureDescription)),
      ),
    );
  }
}
