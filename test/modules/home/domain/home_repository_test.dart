import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/core/domain/services/uri_builder_service.dart';
import 'package:ilia_challenge/core/infra/services/adapters/dependency_injector_adapter/auto_injector.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';

void main() {
  test('Testibg loadMovies (HomeRepository)...', () async {
    injector = AutoInjectorAdapter()..init();

    final repo = HomeRepository();
    final responses = <MovieSection, Map>{};
    Map<MovieSection, UriBuilderService> sections = {};

    for (var element in MovieSection.values) {
      sections[element] = UriBuilderService(path: element.path);
      final (error, response) =
          await repo.loadMovies(route: sections[element]!.uri);
      if (error != null) {
        print('an error occour at (${element.path} message: ${error.message} ');
      } else {
        final Map result = response?.data ?? {};
        responses[element] = result;
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${element.path}) !!!');
      }
    }
  });
}
