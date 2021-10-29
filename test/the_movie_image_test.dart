import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var backDropUrl = "https://image.tmdb.org";

  //--------------------- TheMovieDB CDN -----------------------------

  ///This have any configuration, i go use a standard configuration
  ///get image cover movie
  test("getCoverByPath", () async {
    var query = "/t/p/w500";
    var backDropPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    var response = await Dio().get('$backDropUrl/$query/$backDropPath');
    expect(response.statusCode, 200);
  });

  ///This have any configuration, i go use a standard configuration
  ///get the image Poster movie
  test("getPosterByPath", () async {
    var query = "/t/p/w500";
    var posterPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    var response = await Dio().get('$backDropUrl/$query/$posterPath');
    expect(response.statusCode, 200);
  });
}
