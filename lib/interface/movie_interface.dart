import 'package:dio/dio.dart';

abstract class InterfaceMovie {
  ///Current theater movies showed in home with pagination
  Future<Response?> listMovieCurrentTheater() async {}

  ///show tendency week movies without pagination
  Future<Response?> listMovieTendency() async {}

  ///get details of movie to show a more complete details screen
  Future<Response?> getMovieDetailsById(var sendData) async {}

  ///search a query used on search result :)
  Future<Response?> getMovieSearchQuery(var sendData) async {}

  ///list videos avalaible to add youtube widget on details
  Future<Response?> getMovieVideosById(var sendData) async {}
}
