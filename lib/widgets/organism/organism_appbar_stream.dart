import 'package:flutter/material.dart';
import 'package:ilia_challenge/widgets/pages/home/page_controller.dart';

///icon controller filter for the homeAppBar
StreamBuilder<bool> buildStreamFilterIcon() {
  return StreamBuilder<bool>(
      stream: controllerPage.visibleSearch,
      initialData: controllerPage.visibleSearch.value,
      builder: (context, snapshot) {
        return Icon(snapshot.data! ? Icons.close : Icons.filter_alt);
      });
}

///icon controller search for the homeAppBar
StreamBuilder<bool> buildStreamSearchIcon() {
  return StreamBuilder<bool>(
      stream: controllerPage.visibleSearch.stream,
      initialData: controllerPage.visibleSearch.value,
      builder: (context, snapshot) {
        return Icon(snapshot.data! ? Icons.close : Icons.search);
      });
}
