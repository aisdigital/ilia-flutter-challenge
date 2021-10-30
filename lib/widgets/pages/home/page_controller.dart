import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/interface/page_interface.dart';

final controllerHomePage = PageHomeController();

class PageHomeController implements InterfacePageController {
  var gridViewController = ScrollController();
  var currentPage = 1;

  @override
  void init() {
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

  @override
  void dispose() {
    gridViewController.dispose();
    currentPage = 0;
  }
}
