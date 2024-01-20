import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixSearchTextField extends StatelessWidget {
  const IliaflixSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGrey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        icon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.vividRed),
        ),
        hintText: 'Enter the title of a movie',
        hintStyle: TextStyle(
          color: AppColors.lightGrey,
          fontWeight: FontWeight.w300,
        ),
      ),
      onChanged: (filter) {},
    );
  }
}
