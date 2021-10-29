import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';
import 'package:ilia_challenge/bloc/movie_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

class PageDetail extends StatefulWidget {
  final Results result;

  PageDetail(this.result);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<PageDetail> {
  @override
  void initState() {
    super.initState();
    streamMovie.getMovieDetailsById({"movieId": widget.result.id});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //cover and video
        Container(
          color: primaryColor,
          width: MediaQuery.of(context).size.width,

          ///withou number magic, 9:16 is the cover proportion
          height: (9 / 16) * MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: streamImage.getMovieUrlCover(widget.result.backdropPath),
              builder: (context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  return CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    fit: BoxFit.fitWidth,
                  );
                } else {
                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ),

        //description
        Container(
          // color: Colors.purple,
          height: 200,
          width: 200,
        ),
        //others informations
        Container(
          // color: Colors.deepOrange,
          height: 200,
          width: 200,
        )
      ],
    );
  }
}
