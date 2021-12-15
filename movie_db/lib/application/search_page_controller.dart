import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class SearchPageController extends GetxController {
  SearchPageController();

  final _apiService = ApiService();

  final movieList = Rxn<List<Movie>>();
  final searchTextEditingController = Rx(TextEditingController());
  final loadCount = RxInt(1);
  var isLoading = true.obs;
  final initialQuery = Rxn<String>();

  Future<void> loadMore() async {
    try {
      loadCount.value = loadCount.value + 1;
      isLoading(true);
      if (initialQuery.value != null) {
        await search(initialQuery.value!, loadCount.value);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> search(String query, int page) async {
    initialQuery.value = query;
    if (movieList.value != null) {
      movieList.value!
          .addAll(await _apiService.searchMovie(query, loadCount.value));
    } else {
      movieList.value = await _apiService.searchMovie(query, loadCount.value);
    }
  }
}
