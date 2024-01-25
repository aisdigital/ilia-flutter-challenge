import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilia_challenge/app/constants/constants.dart';

class TrailerMovies {
  Future<String> getMovieTrailer(List movieTrailer, String movieid) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieid/videos?api_key=${Constants.apiKey}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('results') && data['results'] is List) {
        movieTrailer = data['results'];

        for (var trailer in movieTrailer) {
          if (trailer['type'] == 'Trailer' && trailer['site'] == 'YouTube') {
            return trailer['key'];
          }
        }
      }
    } else {
      throw Exception('Failed to load movie videos.');
    }

    return '';
  }
}
