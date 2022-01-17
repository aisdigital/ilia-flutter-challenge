import 'package:dio/dio.dart';

const url = 'https://api.themoviedb.org/3';

const thisContentType = 'application/json;charset=utf-8';

const chaveApi = 
  'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTYyZTA3ODY3ZDk0YTFmMmU0YWQ1NjA5OGJlNDZiMCIsInN1YiI6IjYxNzcyZTRmOTI0Y2U1MDA2M2MyMzVhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wCWBwOaisPHxydv3KeXr3Ad3H_q7jA-_8kvFfi0togc';


class DioBuilderFilmes extends BaseOptions{

  @override
  String get baseUrl => url;

  @override
  String get contentType => thisContentType;

  @override
  Map<String, dynamic> get headers => {'Authorization': 'Bearer $chaveApi'};
}