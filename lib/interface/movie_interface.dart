import 'package:dio/dio.dart';

abstract class InterfaceMovie {
  Future<Response?> listMovieCurrentTheater() async {}

  Future<Response?> listMovieUpcomingTheater() async {}

  Future<Response?> listMovieTendency() async {}

  Future<Response?> getMovieDetailsById(var sendData) async {}

  Future<Response?> getMovieSearchQuery(var sendData) async {}

  Future<Response?> getMovieVideosById(var sendData) async {}
}
