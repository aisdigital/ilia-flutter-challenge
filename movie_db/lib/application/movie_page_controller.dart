import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class MoviePageController extends GetxController {
  MoviePageController();

  //TODO: inject
  final _apiService = ApiService();

  Future<String> getTrailerVideoKey(int id) async {
    return await _apiService.getTrailerVideoKey(id);
  }
}
