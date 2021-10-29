import 'package:ilia_challenge/interface/image_interface.dart';
import 'package:ilia_challenge/provider/image_provider.dart';

class RepositoryImage implements InterfaceImage {
  ProviderImage _providerMovie = ProviderImage();

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    return _providerMovie.getMovieUrlCover(coverPath);
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    return _providerMovie.getMovieUrlPoster(posterPath);
  }
}
