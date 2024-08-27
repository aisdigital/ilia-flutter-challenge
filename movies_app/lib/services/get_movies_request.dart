import 'package:dio/dio.dart';
import 'package:movies_app/models/movie_model.dart';

class RequestMovies {

  Future<List<MovieModel>> requestMovies() async {
    final dio = Dio();
    const token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMjM2OGVkNDA3NTQ5NjZlYzYyYzBlNjczYTVhMzljMyIsIm5iZiI6MTcyNDcxNzcyOC4yMjIyNjUsInN1YiI6IjY2Y2QxOTgxOGYyMGMxNTllYTk3YzFjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.us5MNUDpNHzN1wMcAj7LbplZk8hIGz-EN_dNkp_Prps';
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/now_playing?language=en-US',
      options: Options(headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer $token",
      }));
    
    final json = response.data;

    return List<MovieModel>.from(json.map((movie) {
      return MovieModel.fromJson(movie);
    }));
  }
}