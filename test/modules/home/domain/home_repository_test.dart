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

    // when(() => repo.loadMovies(route: discover.uriMoviesList)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: discoverMock))));
    // when(() => repo.loadMovies(route: nowPlaying.uriMoviesList)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: nowPlayingMock))));
    // when(() => repo.loadMovies(route: popular.uriMoviesList)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: popularMock))));
    // when(() => repo.loadMovies(route: upcoming.uriMoviesList)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: upcomingMock))));

    test('Testing ${MovieSection.nowPlaying} ...', () async {
      if (nowPlaying.uriMoviesList == null) return;
      final (error, response) =
          await repo.loadMovies(route: nowPlaying.uriMoviesList!);

      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${nowPlaying.uriMoviesList} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${nowPlaying.uriMoviesList}) !!!');
      }
    });
    test('Testing ${MovieSection.discover} ...', () async {
      if (discover.uriMoviesList == null) return;
      final (error, response) =
          await repo.loadMovies(route: discover.uriMoviesList!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${discover.uriMoviesList} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'}  pages found at (${discover.uriMoviesList}) !!!');
      }
    });
    test('Testing ${MovieSection.popular} ...', () async {
      if (popular.uriMoviesList == null) return;
      final (error, response) =
          await repo.loadMovies(route: popular.uriMoviesList!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${popular.uriMoviesList} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result:  ${result['total_pages'] ?? 'ops... no'}  pages found at (${popular.uriMoviesList}) !!!');
      }
    });
    test('Testing ${MovieSection.upcoming} ...', () async {
      // PAGES LOADED AFTER LAST PAGE COMES WITH EMPTY RESULT
      // MoviesUriBuilderService sets uri to null after last page
      upcoming.handleLastPage(last: 38);
      for (var i = 0; i < 38; i++) {
        print('index: ${upcoming.uriMoviesList}');
        upcoming.nextPage();
      }
      print(upcoming.uriMoviesList);
      if (upcoming.uriMoviesList == null) return;

      final (error, response) =
          await repo.loadMovies(route: upcoming.uriMoviesList!);
      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${upcoming.uriMoviesList} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${upcoming.uriMoviesList}) !!!');
        // print('upcoming rerult $result');
      }
    });
    // test('Testing ${MovieSection.nowPlaying} ...', () async {
    //   final nowPlaying = UriBuilderService(path: MovieSection.nowPlaying.path);
    //   final (error, response) = await repo.loadMovies(route: nowPlaying.uriMoviesList);
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
