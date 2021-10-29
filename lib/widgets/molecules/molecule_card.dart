import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';
import 'package:ilia_challenge/model/movies_model.dart';

///Movie card molecule
class BuildCardMovie extends StatefulWidget {
  final Results result;

  BuildCardMovie(
    this.result, {
    Key? key,
  }) : super(key: key);

  @override
  _BuildCardMovieState createState() => _BuildCardMovieState();
}

class _BuildCardMovieState extends State<BuildCardMovie>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
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
            future: streamImage.getMovieUrlCover(widget.result.posterPath),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
