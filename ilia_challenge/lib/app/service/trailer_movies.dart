import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilia_challenge/app/constants/constants.dart';

class TrailerMovies{
    Future<String> getMovieTrailer(
      List movieTrailer, String trailerYouTubeID, String movieid) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${movieid}/videos?api_key=${Constants.apiKey}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      movieTrailer = data.values.toList()[1];
      for (var trailer in movieTrailer) {
        if (trailer['name'] == 'Official Trailer') {
          trailerYouTubeID = trailer['key'];
          break;
        }
      }
    } else {
      throw Exception('Failed to load movie videos.');
    }
    return trailerYouTubeID;
  }
}