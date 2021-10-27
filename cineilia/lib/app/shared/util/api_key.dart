import 'package:dio/dio.dart';

const chaveApi = 
  'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTYyZTA3ODY3ZDk0YTFmMmU0YWQ1NjA5OGJlNDZiMCIsInN1YiI6IjYxNzcyZTRmOTI0Y2U1MDA2M2MyMzVhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wCWBwOaisPHxydv3KeXr3Ad3H_q7jA-_8kvFfi0togc';

const baseURL = 'https://api.themoviedb.org/3';

final dioOptions = BaseOptions(
  baseUrl: baseURL,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $chaveApi'},
);