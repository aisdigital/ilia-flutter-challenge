import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class HomePageController extends GetxController {
  HomePageController();

  final _apiService = ApiService();
  final scrollController = ScrollController();

  final movies = Rxn<List<Movie>>();
  final itemNumberLimit = RxInt(20);

  @override
  void onInit() {
    super.onInit();
    getNowPlaying();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        itemNumberLimit.value = itemNumberLimit.value + 10;
        print(itemNumberLimit);
      }
    });
  }

  Future<void> getNowPlaying() async {
    movies.value = await _apiService.getNowPlaying();
  }
}
