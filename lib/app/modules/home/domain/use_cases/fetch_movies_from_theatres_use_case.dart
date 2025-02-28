import 'package:pixel_cinema/app/modules/home/domain/entities/page_entity.dart';
import 'package:pixel_cinema/app/modules/home/domain/repositories/movies_repository.dart';

abstract class FetchMoviesFromTheatresUseCase {
  Future<PageEntity> call({int pageNumber = 1});
}

class FetchMoviesFromTheatresUseCaseImpl implements FetchMoviesFromTheatresUseCase {
  FetchMoviesFromTheatresUseCaseImpl({
    required this.repository,
  });

  final MoviesRepository repository;

  @override
  Future<PageEntity> call({int pageNumber = 1}) async {
    final page = PageEntity.fromJson(await repository.fetchPage(pageNumber));

    return page;
  }
}
