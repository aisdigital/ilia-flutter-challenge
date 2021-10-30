import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';

void main() {
  test("loadMoreMovieCurrentTheater()", () async {
    await streamMovie.listMovieCurrentTheater(nextPage: 2);
    await streamMovie.listMovieCurrentTheater(nextPage: 3);
    expect(streamMovie.movies.value!.results!.length, 40);
  });

  test("listMovieCurrentTheater()", () async {
    Response? response = await streamMovie.listMovieCurrentTheater(nextPage: 1);
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

  test("getMovieDetailsSetStream()", () async {
    await streamMovie.getMovieDetailsById({"movieId": "5"});
    expect(streamMovie.details.value, isNotNull);
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

  test("getMovieCloseStream()", () async {
    streamMovie.dispose();
    expect(streamMovie.details.isClosed && streamMovie.details.isClosed, true);
  });
}
