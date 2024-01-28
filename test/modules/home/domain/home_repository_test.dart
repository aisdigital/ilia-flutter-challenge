import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/core/domain/services/movies_uri_builder_service.dart';
import 'package:ilia_challenge/core/infra/services/adapters/dependency_injector_adapter/auto_injector.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';
import 'package:mocktail/mocktail.dart';

import '../../../load_movie_mock.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  group('Testing (HomeRepository)...', () {
    injector = AutoInjectorAdapter()..init();
    final repo = HomeRepository(); // MockHomeRepository(); //

    final discover = MoviesUriBuilderService()
      ..setPath(path: MovieSection.discover.path);
    final nowPlaying = MoviesUriBuilderService()
      ..setPath(path: MovieSection.nowPlaying.path);
    final popular = MoviesUriBuilderService()
      ..setPath(path: MovieSection.popular.path);
    final upcoming = MoviesUriBuilderService()
      ..setPath(path: MovieSection.upcoming.path);

    // when(() => repo.loadMovies(route: discover.uriMovies)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: discoverMock))));
    // when(() => repo.loadMovies(route: nowPlaying.uriMovies)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: nowPlayingMock))));
    // when(() => repo.loadMovies(route: popular.uriMovies)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: popularMock))));
    // when(() => repo.loadMovies(route: upcoming.uriMovies)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: upcomingMock))));

    test('Testing ${MovieSection.nowPlaying} ...', () async {
      if (nowPlaying.uriMovies == null) return;
      final (error, response) =
          await repo.loadMovies(route: nowPlaying.uriMovies!);

      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${nowPlaying.uriMovies} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${nowPlaying.uriMovies}) !!!');
      }
    });
    test('Testing ${MovieSection.discover} ...', () async {
      if (discover.uriMovies == null) return;
      final (error, response) =
          await repo.loadMovies(route: discover.uriMovies!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${discover.uriMovies} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'}  pages found at (${discover.uriMovies}) !!!');
      }
    });
    test('Testing ${MovieSection.popular} ...', () async {
      if (popular.uriMovies == null) return;
      final (error, response) =
          await repo.loadMovies(route: popular.uriMovies!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${popular.uriMovies} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result:  ${result['total_pages'] ?? 'ops... no'}  pages found at (${popular.uriMovies}) !!!');
      }
    });
    test('Testing ${MovieSection.upcoming} ...', () async {
      // PAGES LOADED AFTER LAST PAGE COMES WITH EMPTY RESULT
      // MoviesUriBuilderService sets uri to null after last page
      upcoming.handleLastPage(last: 38);
      for (var i = 0; i < 38; i++) {
        print('index: ${upcoming.uriMovies}');
        upcoming.nextPage();
      }
      print(upcoming.uriMovies);
      if (upcoming.uriMovies == null) return;

      final (error, response) =
          await repo.loadMovies(route: upcoming.uriMovies!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${upcoming.uriMovies} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${upcoming.uriMovies}) !!!');
        // print('upcoming rerult $result');
      }
    });
    // test('Testing ${MovieSection.nowPlaying} ...', () async {
    //   final nowPlaying = UriBuilderService(path: MovieSection.nowPlaying.path);
    //   final (error, response) = await repo.loadMovies(route: nowPlaying.uriMovies);
    //   if (error != null) {
    //     expect(error, null);
    //     print(
    //         'an error occour at (${nowPlaying.path} message: ${error.message} ');
    //   } else {
    //     final Map result = response?.data ?? {};
    //     print(
    //         'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${nowPlaying.path}) !!!');
    //   }
    // });
  });
}
