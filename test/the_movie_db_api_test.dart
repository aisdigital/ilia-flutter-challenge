import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var apiKey = "7e49e84a68cdbea10b67f65709d1bc64";

  var baseUrl = "https://api.themoviedb.org";
  var backDropUrl = "https://image.tmdb.org";

  var apiVersion = "3";
  var page = 1;
  var language = "pt-BR";

  ///list tendency movie with paginate and language example
  test("listTendencyMovie", () async {
    var query = "trending/all/day";
    var response = await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language");
    expect(response.statusCode, 200);
  });

  ///list movie on Theaters with paginate and language example
  test("listCurrentTheatersMovie", () async {
    var query = "movie/now_playing";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///list movie upcoming on Theaters with paginate and language example
  test("listCurrentTheatersMovie", () async {
    var query = "movie/upcoming";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///get moview details by id
  test("getMovieDetailsByID", () async {
    var query = "movie/5";
    var response =
        await Dio().get('$baseUrl/$apiVersion/$query?api_key=$apiKey');
    expect(response.statusCode, 200);
  });

  ///This have any configuration, i go use a standard configuration
  ///get image cover movie
  test("getCover", () async {
    var query = "/t/p/w500";
    var backDropPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    var response = await Dio().get('$backDropUrl/$query/$backDropPath');
    expect(response.statusCode, 200);
  });

  ///This have any configuration, i go use a standard configuration
  ///get the image Poster movie
  test("getPoster", () async {
    var query = "/t/p/w500";
    var posterPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    var response = await Dio().get('$backDropUrl/$query/$posterPath');
    expect(response.statusCode, 200);
  });
}
