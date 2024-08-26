import 'package:core/type/output.dart';
import 'package:service/movie/entities/movie_entity.dart';

abstract class MovieDetailsRepository {
  Future<Output<MovieEntity>> fetch({required int id});
}
