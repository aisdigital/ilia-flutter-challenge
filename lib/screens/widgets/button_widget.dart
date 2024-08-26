import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';
import 'package:ilia_flutter_challenge/theme/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onClick;
  const ButtonWidget({super.key, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Center(
        child: Container(
          height: 42,
          width: 256,
          decoration: BoxDecoration(
              color: AppColors.darkMainAmber,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              semanticsLabel: label,
              label.toUpperCase(),
              style: AppTextStyles.button,
            )),
          ),
        ),
      ),
    );
  }
}
