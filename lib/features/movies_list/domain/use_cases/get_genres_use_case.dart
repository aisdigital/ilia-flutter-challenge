import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/core/use_case/use_case.dart';
import 'package:movie_catalog/features/movies_list/domain/repositories/genre_repository.dart';

class GetGenresUseCase implements UseCase {
  final GenreRepository genreRepository;

  const GetGenresUseCase(
    this.genreRepository,
  );

  @override
  Future<Either<Failure, List<Genre>>> call(params) async {
    final genres = await genreRepository.getGenres();

    return genres;
  }
}
