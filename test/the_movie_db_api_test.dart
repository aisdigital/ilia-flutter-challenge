import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var apiKey = "7e49e84a68cdbea10b67f65709d1bc64";

  var baseUrl = "https://api.themoviedb.org";

  var apiVersion = "3";
  var page = 1;
  var language = "pt-BR";

  //--------------------- TheMovieDB API-----------------------------

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
  test("listUpcomingTheatersMovie", () async {
    var query = "movie/upcoming";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///get movie details by id
  test("getMovieDetailsByID", () async {
    var query = "movie/5";
    var response =
        await Dio().get('$baseUrl/$apiVersion/$query?api_key=$apiKey');
    expect(response.statusCode, 200);
  });

  ///search moview with querySearch
  test("searchMovieWithQuery", () async {
    var query = "search/movie";
    var querySearch = "frozen";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&query=$querySearch&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///get list of videos by movie id
  ///inside result, can get the youtube key, to use to get video on youtu.be/watch?=$key
  ///
  ///like:
  ///key = S_Pd2pGkq54
  ///usage: youtu.be/watch?v=S_Pd2pGkq54
  test("getVideosByMovieId", () async {
    var query = "movie/5/videos";
    var response =
        await Dio().get('$baseUrl/$apiVersion/$query?api_key=$apiKey');
    expect(response.statusCode, 200);
  });
}
