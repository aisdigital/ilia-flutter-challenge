import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

final controllerPage = PageController();

class PageController {
  var gridViewController = ScrollController();

  ///make this private and create setters and getters
  BehaviorSubject<bool> visibleSearch = BehaviorSubject.seeded(false);

  init() {
    gridViewController.addListener(() {
      if (gridViewController.position.atEdge) {
        if (gridViewController.position.pixels == 0) {
          /// add pull to refresh?
        } else {
          print("load more");

          ///start animation load
          ///load more
          ///stop animation load
        }
      }
    });
  }

  changeStatus() {
    visibleSearch.sink.add(!visibleSearch.value);
  }

  void dispose() {
    visibleSearch.close();
  }
}
