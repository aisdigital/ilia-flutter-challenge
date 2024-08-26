import 'package:core/type/output.dart';
import 'package:service/movie/entities/movie_entity.dart';

abstract class MovieSearchRepository {
  Future<Output<List<MovieEntity>>> fetch({required String query, required int page});
}
