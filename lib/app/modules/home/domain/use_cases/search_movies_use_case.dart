import 'package:pixel_cinema/app/modules/home/domain/entities/page_entity.dart';
import 'package:pixel_cinema/app/modules/home/domain/repositories/movies_repository.dart';

abstract class SearchMoviesUseCase {
  Future<PageEntity> call({required String query});
}

class SearchMoviesUseCaseImpl implements SearchMoviesUseCase {
  SearchMoviesUseCaseImpl({required this.repository});

  final MoviesRepository repository;

  @override
  Future<PageEntity> call({required String query}) async {
    final page = PageEntity.fromJson(await repository.searchMovies(query));

    return page;
  }
}
