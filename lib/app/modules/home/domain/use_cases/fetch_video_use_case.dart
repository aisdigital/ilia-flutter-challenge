import 'package:pixel_cinema/app/modules/home/domain/repositories/movies_repository.dart';

abstract class FetchVideoUseCase {
  Future<String?> call({required String movieId});
}

class FetchVideoUseCaseImpl implements FetchVideoUseCase {
  FetchVideoUseCaseImpl({
    required this.repository,
  });

  final MoviesRepository repository;

  @override
  Future<String?> call({required String movieId}) async {
    final data = await repository.fetchVideo(movieId);
    final String? trailerKey = data['results'] == null || data['results'].isEmpty ? null : data['results'][0]['key'];

    return trailerKey;
  }
}
