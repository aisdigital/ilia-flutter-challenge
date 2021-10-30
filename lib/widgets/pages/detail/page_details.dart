import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';
import 'package:ilia_challenge/widgets/organism/organism_detail.dart';
import 'package:ilia_challenge/widgets/pages/detail/page_controller.dart';

class PageDetail extends StatefulWidget {
  final MoviesResults result;

  PageDetail(this.result);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<PageDetail> {
  @override
  void dispose() {
    // TODO: implement dispose
    controllerDetailPage.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controllerDetailPage.init();
    streamMovie
        .getMovieDetailsById({"movieId": widget.result.id}).then((value) => {
              Future.delayed(Duration(milliseconds: 300), () {
                controllerDetailPage.ready();
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListView(
        padding: EdgeInsets.only(bottom: 64),
        shrinkWrap: true,
        children: [
          Container(
            color: primaryColor,
            width: MediaQuery.of(context).size.width,

            ///withou number magic, 9:16 is the cover proportion
            height: (9 / 16) * MediaQuery.of(context).size.width,
            child: buildDetailCover(widget.result),
          ),
          buildDetailsBody(widget.result.id),

          //others informations
        ],
      ),
    );
  }
}
