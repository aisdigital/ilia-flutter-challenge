import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';
import 'package:ilia_flutter_challenge/theme/app_text_styles.dart';

class TextInputWidget extends StatelessWidget {
  final String text;
  final Icon? icon;
  final TextEditingController controller;
  final VoidCallback? completed;
  final Function(String)? onChanged;
  const TextInputWidget({
    super.key,
    required this.text,
    this.onChanged,
    this.completed,
    this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 16),
      child: TextFormField(
        controller: controller,
        onEditingComplete: completed,
        cursorColor: AppColors.darkMainAmber,
        style:
            AppTextStyles.button.copyWith(color: AppColors.darkSecondaryText),
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: text,
            hintStyle: AppTextStyles.appBarTitle,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkSecondaryText)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkSecondaryText)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkMainAmber)),
            contentPadding: const EdgeInsets.only(left: 22, top: 12)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}
