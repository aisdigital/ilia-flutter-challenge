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

    final discover = MoviesUriBuilderService(path: MovieSection.discover.path);
    final nowPlaying =
        MoviesUriBuilderService(path: MovieSection.nowPlaying.path);
    final popular = MoviesUriBuilderService(path: MovieSection.popular.path);
    final upcoming = MoviesUriBuilderService(path: MovieSection.upcoming.path);

    // when(() => repo.loadMovies(route: discover.uri)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: discoverMock))));
    // when(() => repo.loadMovies(route: nowPlaying.uri)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: nowPlayingMock))));
    // when(() => repo.loadMovies(route: popular.uri)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: popularMock))));
    // when(() => repo.loadMovies(route: upcoming.uri)).thenAnswer(
    //     (_) => Future.value((null, IntResponse(data: upcomingMock))));

    test('Testing ${MovieSection.nowPlaying} ...', () async {
      if (nowPlaying.uri == null) return;
      final (error, response) = await repo.loadMovies(route: nowPlaying.uri!);

      if (error != null) {
        expect(error, null);
        print(
            'an error occour at (${nowPlaying.path} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${nowPlaying.path}) !!!');
      }
    });
    test('Testing ${MovieSection.discover} ...', () async {
      if (discover.uri == null) return;
      final (error, response) = await repo.loadMovies(route: discover.uri!);
      if (error != null) {
        expect(error, null);
        print('an error occour at (${discover.path} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'}  pages found at (${discover.path}) !!!');
      }
    });
    test('Testing ${MovieSection.popular} ...', () async {
      if (popular.uri == null) return;
      final (error, response) = await repo.loadMovies(route: popular.uri!);
      if (error != null) {
        expect(error, null);
        print('an error occour at (${popular.path} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result:  ${result['total_pages'] ?? 'ops... no'}  pages found at (${popular.path}) !!!');
      }
    });
    test('Testing ${MovieSection.upcoming} ...', () async {
      // PAGES LOADED AFTER LAST PAGE COMES WITH EMPTY RESULT
      // MoviesUriBuilderService sets uri to null after last page
      upcoming.handleLastPage(lastPage: 38);
      for (var i = 0; i < 38; i++) {
        print('index: ${upcoming.uri}');
        upcoming.nextPage();
      }
      print(upcoming.uri);
      if (upcoming.uri == null) return;

      final (error, response) = await repo.loadMovies(route: upcoming.uri!);
      if (error != null) {
        expect(error, null);
        print('an error occour at (${upcoming.path} message: ${error.message}');
      } else {
        final Map result = response?.data ?? {};
        print(
            'success! result: ${result['total_pages'] ?? 'ops... no'} pages found at (${upcoming.path}) !!!');
        // print('upcoming rerult $result');
      }
    });
    // test('Testing ${MovieSection.nowPlaying} ...', () async {
    //   final nowPlaying = UriBuilderService(path: MovieSection.nowPlaying.path);
    //   final (error, response) = await repo.loadMovies(route: nowPlaying.uri);
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
