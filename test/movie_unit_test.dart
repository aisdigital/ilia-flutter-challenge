import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';

void main() {
  test("listMovieCurrentTheater()", () async {
    Response? response = await streamMovie.listMovieCurrentTheater();
    expect(response!.statusCode, 200);
  });

  test("listMovieUpcomingTheater()", () async {
    Response? response = await streamMovie.listMovieUpcomingTheater();
    expect(response!.statusCode, 200);
  });

  test("listMovieTendency()", () async {
    Response? response = await streamMovie.listMovieTendency();
    expect(response!.statusCode, 200);
  });

  test("getMovieDetailsById()", () async {
    Response? response =
        await streamMovie.getMovieDetailsById({"movieId": "5"});
    expect(response!.statusCode, 200);
  });

  test("getMovieSearchQuery()", () async {
    Response? response =
        await streamMovie.getMovieSearchQuery({"searchQuery": "frozen"});
    expect(response!.statusCode, 200);
  });

  test("getMovieVideosById()", () async {
    Response? response = await streamMovie.getMovieVideosById({"movieId": "5"});
    expect(response!.statusCode, 200);
  });
}
