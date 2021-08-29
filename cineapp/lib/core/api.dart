import 'package:dio/dio.dart';

const basURL = 'https://api.themoviedb.org/3/';
const apiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTdkOTgxZDJmZWY5ZDg5ZDE1MzQ1MmE4YTFhNTY4NyIsInN1YiI6IjYwMDg5ZGYwNDFhZDhkMDAzZjhmNGM1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DRfH7AeOz4wdLDaLBnTQSFubO7VVinSA1sD9mGz7tKE';

const serverError = 'Faild to connect to the server! Try again later';

final dioOptions = BaseOptions(
  baseUrl: basURL,
  connectTimeout: 6000,
  receiveTimeout: 4000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $apiKey'},
);
