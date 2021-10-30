import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ilia_challenge/interface/movie_interface.dart';

///The ideal was to make a singleton api class for dio instantiation, but I'm running out of time to fix this for tomorrow's presentation
class ProviderMovie implements InterfaceMovie {
  var apiKey = "7e49e84a68cdbea10b67f65709d1bc64";

  var baseUrl = "https://api.themoviedb.org";
  var backDropUrl = "https://image.tmdb.org";

  var apiVersion = "3";
  var page = 1;
  var language = "en-ES";

  var cacheDurationInSeconds = 60 * 2;

  @override
  Future<Response?> getMovieDetailsById(sendData) async {
    var query = "movie/${sendData["movieId"]}";
    return await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&language=$language',
        options: buildCacheOptions(Duration(seconds: cacheDurationInSeconds)));
  }

  @override
  Future<Response?> getMovieSearchQuery(sendData) async {
    var query = "search/movie";
    return await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&query=${sendData["searchQuery"]}&page=$page&language=$language',
        options: buildCacheOptions(Duration(seconds: cacheDurationInSeconds)));
  }

  @override
  Future<Response?> listMovieCurrentTheater({int? nextPage}) async {
    var query = "movie/now_playing";
    return await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=${nextPage ?? page}&language=$language',
        options: buildCacheOptions(Duration(seconds: 5)));
  }

  @override
  Future<Response?> listMovieTendency() async {
    var query = "trending/all/day";
    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language",
        options: buildCacheOptions(Duration(seconds: 5)));
  }

  @override
  Future<Response?> getMovieVideosById(sendData) async {
    var query = "movie/${sendData["movieId"]}/videos";
    return await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&language=$language',
        options: buildCacheOptions(Duration(seconds: 5)));
  }
}
