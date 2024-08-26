import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/repositories/now_playing_movies_repository.dart';
import 'package:ilia_flutter_challenge/shared/models/api_response_model.dart';
import 'package:ilia_flutter_challenge/shared/models/movie_model.dart';

class HomeController {
  final NowPlayingMoviesRepository nowPlayingMoviesRepository;

  HomeController(this.nowPlayingMoviesRepository);

  ValueNotifier<String> error = ValueNotifier('');

  ValueNotifier<ApiResponseModel?> movies =
      ValueNotifier<ApiResponseModel?>(null);
  ApiResponseModel? _localResponse;

  final ValueNotifier<int> _page = ValueNotifier(1);
  final ValueNotifier<bool> loading = ValueNotifier(false);

  changeLoadingState(bool value) {
    loading.value = value;
  }

  fetchByPage() async {
    changeLoadingState(true);
    var response = await nowPlayingMoviesRepository.fetchByPage(_page.value);
    if (response.runtimeType == String) {
      //error
      changeLoadingState(false);
      movies.value =
          ApiResponseModel(dates: {}, page: _page.value, results: []);
      return error.value = response;
    }
    if (_page.value > 1) {
      movies.value = movies.value!.copyWith(
          results: movies.value!.results +
              ApiResponseModel.fromMap(response.data).results);
    } else {
      movies.value = ApiResponseModel.fromMap(response.data);
    }
    _page.value++;
    _localResponse = movies.value;
    changeLoadingState(false);
  }

  fieldOnChanged(String value) {
    List<MovieModel> searchResult = _localResponse!.results
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value = movies.value!.copyWith(results: searchResult);
  }
}
