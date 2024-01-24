import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/models/movie.dart';

class SearchMoviesService {
  Future<List<Movie>> fetchAllMovies(String query) async {
    var url =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$query';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
