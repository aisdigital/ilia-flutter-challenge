import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/models/movie.dart';

class PopularService {
  static const _popular =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popular));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
