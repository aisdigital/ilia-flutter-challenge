import 'package:get/get.dart';
import 'package:pixel_cinema/app/core/presentation/stores/state_store.dart';
import 'package:pixel_cinema/app/modules/home/domain/entities/movie_entity.dart';
import 'package:pixel_cinema/app/modules/home/domain/entities/page_entity.dart';

class HomeStore extends StateStore {
  final _movies = RxList<MovieEntity>([]);
  List<MovieEntity> get movies => this._movies;
  set movies(List<MovieEntity> value) => this._movies.value = value;

  final _searchResults = RxList<MovieEntity>([]);
  List<MovieEntity> get searchResults => this._searchResults;
  set searchResults(List<MovieEntity> value) => this._searchResults.value = value;

  final _pages = RxList<PageEntity>([]);
  List<PageEntity> get pages => this._pages;
  set pages(List<PageEntity> value) => this._pages.value = value;
}
