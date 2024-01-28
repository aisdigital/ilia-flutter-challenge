import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';

import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:ilia_challenge/modules/home/view/widgets/ilia_drawer.dart';
import 'package:ilia_challenge/modules/home/view/widgets/ilia_fullscreen_loader.dart';
import 'package:ilia_challenge/modules/home/view/widgets/pull_to_refresh_infitine_list.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ilia_challenge/modules/movie/view/movie_page.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomeBloc bloc = HomeBloc();
  ChallengeCore get core => injector.find<ChallengeCore>();
  IliaRouter get routes => injector.find<IliaRouter>();
  IliaLayout get layout => IliaLayout(context);
  // late final FocusNode node;

  late final AnimationController _animate;

  bool showMenu = false;
  bool showSearchBar = false;
  bool loadDetails = false;

  @override
  void initState() {
    bloc.add(const HomeEvent.started());
    // node = FocusNode();
    _animate = AnimationController(vsync: this, duration: Durations.long1);
    super.initState();
  }

  @override
  void dispose() {
    // node.dispose();
    super.dispose();
  }

  void _handleIconAnimation() {
    setState(() {
      showMenu = !showMenu;
      if (showMenu) {
        _animate.forward();
      } else {
        _animate.reverse();
      }
    });
  }

  String? get _title => bloc.state.currentSection == MovieSection.discover
      ? AppLocalizations.of(context)?.discover
      : bloc.state.currentSection == MovieSection.nowPlaying
          ? AppLocalizations.of(context)?.nowPlaying
          : bloc.state.currentSection == MovieSection.popular
              ? AppLocalizations.of(context)?.popular
              : bloc.state.currentSection == MovieSection.upcoming
                  ? AppLocalizations.of(context)?.upcoming
                  : bloc.state.currentSection == MovieSection.search
                      ? AppLocalizations.of(context)?.search
                      : AppLocalizations.of(context)?.iliaChallenge;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: Platform.isIOS ? false : true,
      child: PopScope(
        canPop: false,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(_title ?? ''),
                leading: const SizedBox.shrink(),
                actions: [
                  IconButton(
                      onPressed: () async {
                        setState(() {
                          showSearchBar = !showSearchBar;
                        });
                        await Future.delayed(Durations.medium2);

                        // if (!showSearchBar) node.unfocus();
                        // if (showSearchBar) node.requestFocus();
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 40,
                      ))
                ],
              ),
              drawer:
                  BlocProvider.value(value: bloc, child: const IliaDrawer()),
              onDrawerChanged: (isOpened) {
                if (!isOpened) _handleIconAnimation();
              },
              body: Center(
                child: BlocBuilder<HomeBloc, HomeState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return PullToRefreshInfiniteList(
                        itemCount:
                            state.movies[state.currentSection]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final movie =
                              state.movies[state.currentSection]?[index];
                          return InkWell(
                            onTap: () async {
                              setState(() => loadDetails = true);
                              try {
                                Completer<Map<String, dynamic>> success =
                                    Completer();
                                bloc.add(HomeEvent.loadMovieDetails(
                                    success: success, movieId: movie['id']));
                                await success.future.then((value) {
                                  final movie = Movie.fromJson(value);

                                  Navigator.pushNamed(
                                    context,
                                    MoviePage.route,
                                    arguments: movie,
                                  );
                                });
                              } finally {}
                              setState(() => loadDetails = false);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(json.encode(movie)),
                              ),
                            ),
                          );
                        },
                        loadNext: () async {
                          final success = Completer<bool>();

                          bloc.add(HomeEvent.nextPageRequested(
                              section: state.currentSection,
                              success: () {
                                success.complete(true);
                              }));

                          return await success.future;
                        },
                        onRefresh: () async {
                          bloc.add(const HomeEvent.started());
                        },
                      );
                    }),
              ),
              floatingActionButton: Builder(
                builder: (context) {
                  return FloatingActionButton(
                    onPressed: () {
                      _handleIconAnimation();
                      Scaffold.of(context).openDrawer();
                    },
                    child: AnimatedIcon(
                      progress: _animate,
                      icon: AnimatedIcons.menu_home,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
            AnimatedCrossFade(
              crossFadeState: showSearchBar
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Durations.medium1,
              firstChild: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 70,
                    width: layout.width * .8,
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.only(bottom: layout.viewInsets.bottom + 20),
                    padding: const EdgeInsets.fromLTRB(30, 15, 15, 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextFormField(
                      // focusNode: node,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {
                        bloc.add(HomeEvent.searchMovies(query: value));
                        setState(() => showSearchBar = false);
                      },
                    ),
                  ),
                ),
              ),
              secondChild: Container(
                height: 70,
                width: layout.width * .8,
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: layout.viewInsets.bottom + 20),
                padding: const EdgeInsets.fromLTRB(30, 15, 15, 5),
              ),
            ),
            IliaFullscreenLoader(
              loading: loadDetails,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
