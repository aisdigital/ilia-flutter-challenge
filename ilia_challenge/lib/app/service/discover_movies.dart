import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/models/movie.dart';

class DiscoverMoviesService{
      static const _searchMovies =
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}';


    Future<List<Movie>> fetchAllMovies() async {
    final response = await http.get(Uri.parse(_searchMovies));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}