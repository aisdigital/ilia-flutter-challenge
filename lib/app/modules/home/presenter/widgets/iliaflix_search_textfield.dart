import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixSearchTextField extends StatelessWidget {
  IliaflixSearchTextField({super.key, required this.store});

  final HomeStore store;
  final TextEditingController controller = TextEditingController();

  Future<void> handleSubmitFunction(String filter) async {
    await store.searchMovies(filter);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.darkGrey,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.vividRed),
          ),
          hintText: 'Insira o título de um filme',
          hintStyle: TextStyle(
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w300,
          ),
          icon: const Icon(Icons.search),
        ),
        onSubmitted: (filter) => handleSubmitFunction(filter),
      ),
    );
  }
}
