import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/application/movie_page_controller.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      MoviePageController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        title: Text(
          'Movie Slasher'.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _controller.movies.value != null
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                      ),
                      shrinkWrap: true,
                      itemCount: _controller.movies.value != null
                          ? _controller.movies.value!.length.clamp(0, 9)
                          : 0,
                      itemBuilder: (context, index) {
                        var movie = _controller.movies.value![index];
                        return InkWell(
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl: movie.backdropPath != null
                                  ? 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
                                  : 'https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1',
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/img_not_found.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        );
                      },
                    )
                  : const CircularProgressIndicator(),
            ],
          );
        }),
      ),
    );
  }
}
