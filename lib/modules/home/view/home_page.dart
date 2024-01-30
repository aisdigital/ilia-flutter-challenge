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
import 'package:ilia_challenge/modules/home/view/widgets/movie_card.dart';
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
  IliaLayout get _layout => IliaLayout(context);
  final HomeBloc _bloc = HomeBloc();
  late final FocusNode _node;
  late final TextEditingController _search;
  late final AnimationController _animate;

  bool showMenu = false;
  bool showSearchBar = false;
  bool loadDetails = false;

  @override
  void initState() {
    _bloc.add(const HomeEvent.started());
    _node = FocusNode();
    _search = TextEditingController();
    _animate = AnimationController(vsync: this, duration: Durations.long1);
    super.initState();
  }

  @override
  void dispose() {
    _node.dispose();
    _search.dispose();

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

  String getTitle() {
    switch (_bloc.state.currentSection) {
      case MovieSection.discover:
        return AppLocalizations.of(context)?.discover ?? '';
      case MovieSection.nowPlaying:
        return AppLocalizations.of(context)?.nowPlaying ?? '';
      case MovieSection.popular:
        return AppLocalizations.of(context)?.popular ?? '';
      case MovieSection.upcoming:
        return AppLocalizations.of(context)?.upcoming ?? '';
      case MovieSection.search:
        return AppLocalizations.of(context)?.search ?? '';
      default:
        return AppLocalizations.of(context)?.iliaChallenge ?? '';
    }
  }

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
                toolbarHeight: 70,
                backgroundColor:
                    Theme.of(context).colorScheme.background.withOpacity(.5),
                centerTitle: true,
                title: Text(
                  getTitle(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                leading: const SizedBox.shrink(),
                actions: [
                  IconButton(
                      onPressed: () async {
                        setState(() {
                          showSearchBar = !showSearchBar;
                        });
                        await Future.delayed(Durations.medium2);

                        if (!showSearchBar) _node.unfocus();
                        if (showSearchBar) _node.requestFocus();
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 35,
                      ))
                ],
              ),
              drawer:
                  BlocProvider.value(value: _bloc, child: const IliaDrawer()),
              onDrawerChanged: (isOpened) {
                if (!isOpened) _handleIconAnimation();
              },
              body: Center(
                child: BlocBuilder<HomeBloc, HomeState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      return PullToRefreshInfiniteList(
                        itemCount:
                            state.movies[state.currentSection]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final movie = Movie.fromJson(
                              state.movies[state.currentSection]?[index]);
                          return InkWell(
                            onTap: () async {
                              setState(() => loadDetails = true);
                              try {
                                Completer<Map<String, dynamic>> success =
                                    Completer();
                                _bloc.add(HomeEvent.loadMovieDetails(
                                    success: success, movieId: movie.id!));
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
                            child: BlocProvider.value(
                                value: _bloc, child: MovieCard(movie: movie)),
                          );
                        },
                        loadNext: () async {
                          final success = Completer<bool>();

                          _bloc.add(HomeEvent.nextPageRequested(
                              section: state.currentSection,
                              success: () {
                                success.complete(true);
                              }));

                          return await success.future;
                        },
                        onRefresh: () async {
                          if (_search.text.isNotEmpty &&
                              _bloc.state.currentSection ==
                                  MovieSection.search) {
                            _bloc.add(
                                HomeEvent.searchMovies(query: _search.text));

                            setState(() => showSearchBar = false);
                          } else {
                            _bloc.add(const HomeEvent.started());
                          }
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
                    width: _layout.width * .8,
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.only(bottom: _layout.viewInsets.bottom + 20),
                    padding: const EdgeInsets.fromLTRB(30, 15, 15, 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextFormField(
                      focusNode: _node,
                      controller: _search,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {
                        _bloc.add(HomeEvent.searchMovies(query: value));

                        setState(() => showSearchBar = false);
                      },
                    ),
                  ),
                ),
              ),
              secondChild: Container(
                height: 70,
                width: _layout.width * .8,
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: _layout.viewInsets.bottom + 20),
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
