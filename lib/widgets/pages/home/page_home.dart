import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/pages/home/page_controller.dart';
import 'package:ilia_challenge/widgets/pages/search/page_search.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text("TheMovieDB"),
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.black,
          foregroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                controllerPage.changeStatus();
              },
              icon: StreamBuilder<bool>(
                  stream: controllerPage.visibleSearch,
                  initialData: controllerPage.visibleSearch.value,
                  builder: (context, snapshot) {
                    return Icon(
                        snapshot.data! ? Icons.close : Icons.filter_alt);
                  })),
          backgroundColor: primaryColor,
          actions: [
            IconButton(
                onPressed: () => {
                      showSearch(
                        context: context,
                        delegate: SearchPage(),
                      )
                    },
                icon: StreamBuilder<bool>(
                    stream: controllerPage.visibleSearch.stream,
                    initialData: controllerPage.visibleSearch.value,
                    builder: (context, snapshot) {
                      return Icon(snapshot.data! ? Icons.close : Icons.search);
                    })),
          ],
        ),
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
                        curve: Curves.ease,
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
                                      backgroundColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      label: const Text('Tendecy'),
                                      onPressed: () {
                                        print(
                                            'If you stand for nothing, Burr, what’ll you fall for?');
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ActionChip(
                                      backgroundColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      label: const Text('Current'),
                                      onPressed: () {
                                        print(
                                            'If you stand for nothing, Burr, what’ll you fall for?');
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ActionChip(
                                      backgroundColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      label: const Text('Upcoming'),
                                      onPressed: () {
                                        print(
                                            'If you stand for nothing, Burr, what’ll you fall for?');
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                FutureBuilder<Response?>(
                    future: streamMovie.listMovieUpcomingTheater(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        var movieList =
                            MoviesModel.fromJson(snapshot.data!.data);

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
                                itemCount: movieList.results!.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: FutureBuilder<String?>(
                                                builder: (context, snapshot) {
                                                  return Ink(
                                                    child: CachedNetworkImage(
                                                      cacheKey: snapshot.data,
                                                      imageUrl: snapshot.data ??
                                                          "https://www.blogson.com.br/wp-content/uploads/2017/10/584b607f5c2ff075429dc0e7b8d142ef.gif",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                                future: streamImage
                                                    .getMovieUrlCover(movieList
                                                        .results![index]
                                                        .posterPath),
                                              ),
                                            )),
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
                                                      const EdgeInsets.all(4.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: double.parse(
                                                            movieList
                                                                .results![index]
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
                                                    movieList.results![index]
                                                                .voteAverage
                                                                .toString()
                                                                .length <
                                                            3
                                                        ? movieList
                                                                .results![index]
                                                                .voteAverage
                                                                .toString() +
                                                            ".0"
                                                        : movieList
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
                                                  title: Text(movieList
                                                      .results![index].title),
                                                  content: Text(
                                                      "Data de lançamento \n" +
                                                          movieList
                                                              .results![index]
                                                              .releaseDate),
                                                ),
                                              );
                                            },
                                            onTap: () {},
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
