import 'package:ilia_challenge/interface/image_interface.dart';
import 'package:ilia_challenge/repository/image_repository.dart';

final streamImage = ImageController();

class ImageController implements InterfaceImage {
  final RepositoryImage _repository = RepositoryImage();

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    return _repository.getMovieUrlCover(coverPath);
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    return _repository.getMovieUrlPoster(posterPath);
  }
}
