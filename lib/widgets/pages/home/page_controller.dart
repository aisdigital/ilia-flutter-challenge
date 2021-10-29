import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:rxdart/rxdart.dart';

final controllerPage = PageController();

class PageController {
  var gridViewController = ScrollController();
  var currentPage = 1;

  ///make this private and create setters and getters
  BehaviorSubject<bool> visibleSearch = BehaviorSubject.seeded(false);

  init() {
    gridViewController.addListener(() {
      if (gridViewController.position.atEdge) {
        if (gridViewController.position.pixels == 0) {
          /// add pull to refresh? no time
        } else {
          currentPage++;
          streamMovie.listMovieCurrentTheater(nextPage: currentPage);
        }
      }
    });
  }

  changeStatus() {
    visibleSearch.sink.add(!visibleSearch.value);
  }

  void dispose() {
    visibleSearch.close();
    gridViewController.dispose();
    currentPage = 0;
  }
}
