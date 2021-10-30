import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/widgets/molecules/molecule_appbar.dart';
import 'package:ilia_challenge/widgets/organism/organism_home.dart';
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
    controllerHomePage.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerHomePage.init();
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
                buildStreamBuilderMovies(
                    gridController: controllerHomePage.gridViewController),
              ],
            )),
      ),
    );
  }
}
