import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/util/util_route.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_appbar.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_card.dart';
import 'package:ilia_challenge/widgets/pages/detail/page_details.dart';
import 'package:ilia_challenge/widgets/pages/home/page_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerPage.init();
    streamMovie.listMovieCurrentTheater();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                StreamBuilder<bool>(
                    stream: controllerPage.visibleSearch.stream,
                    initialData: controllerPage.visibleSearch.value,
                    builder: (context, snapshot) {
                      return AnimatedOpacity(
                        opacity: snapshot.data! ? 1 : 0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(32))),
                          height: snapshot.data! ? kToolbarHeight : 0,
                          width: MediaQuery.of(context).size.width,
                          duration: const Duration(milliseconds: 200),
                          child: Center(
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ActionChip(
                                      backgroundColor: Colors.grey,
                                      labelStyle:
                                          TextStyle(color: Colors.white60),
                                      label: const Text('Tendency'),
                                      onPressed: () {}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ActionChip(
                                      backgroundColor: Colors.white,
                                      shadowColor: Colors.deepOrange,
                                      elevation: 8,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      label: const Text('On Theater'),
                                      onPressed: () {}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ActionChip(
                                      backgroundColor: Colors.grey,
                                      labelStyle:
                                          TextStyle(color: Colors.white60),
                                      label: const Text('Upcoming'),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                StreamBuilder<MoviesModel?>(
                    stream: streamMovie.behaviorSubjectMoviesOnTheater,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        if (snapshot.data != null) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 8),
                              child: GridView.builder(
                                  controller: controllerPage.gridViewController,

                                  ///without magic numbers, 8 / 12 is the poster proportion inside TheMovieDB.
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 8 / 12),
                                  itemCount: snapshot.data!.results!.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Positioned.fill(
                                          child: BuildCardMovie(
                                              snapshot.data!.results![index]),
                                        ),
                                        Positioned(
                                          left: 8,
                                          bottom: 8,
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            decoration: new BoxDecoration(
                                              color: Colors.black87,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: double.parse(
                                                              snapshot
                                                                  .data!
                                                                  .results![
                                                                      index]
                                                                  .voteAverage
                                                                  .toString()) /
                                                          10,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      snapshot
                                                                  .data!
                                                                  .results![
                                                                      index]
                                                                  .voteAverage
                                                                  .toString()
                                                                  .length <
                                                              3
                                                          ? snapshot
                                                                  .data!
                                                                  .results![
                                                                      index]
                                                                  .voteAverage
                                                                  .toString() +
                                                              ".0"
                                                          : snapshot
                                                              .data!
                                                              .results![index]
                                                              .voteAverage
                                                              .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Material(
                                            color: Colors.white10,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              splashColor: Colors.white12,
                                              onLongPress: () {
                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      CupertinoAlertDialog(
                                                    title: Text(snapshot.data!
                                                        .results![index].title),
                                                    content: Text(
                                                        "Data de lançamento \n" +
                                                            snapshot
                                                                .data!
                                                                .results![index]
                                                                .releaseDate),
                                                  ),
                                                );
                                              },
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    CustomRoute(
                                                        settings: RouteSettings(
                                                            name: "/details"),
                                                        builder: (_) {
                                                          return PageDetail(
                                                              snapshot.data!
                                                                      .results![
                                                                  index]);
                                                        }));
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          );
                        } else {
                          return Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      } else {
                        return Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
