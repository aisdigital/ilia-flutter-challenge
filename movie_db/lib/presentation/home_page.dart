import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/application/home_page_controller.dart';

import 'movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      HomePageController(),
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
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _controller.movies.value != null
                  ? Obx(
                      () => GridView.builder(
                        controller: _controller.scrollController,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        shrinkWrap: true,
                        itemCount: _controller.movies.value != null
                            ? _controller.movies.value!.length
                                .clamp(0, _controller.itemNumberLimit.value)
                            : 0,
                        itemBuilder: (context, index) {
                          var movie = _controller.movies.value![index];
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MoviePage(
                                  movie,
                                ),
                              ),
                            ),
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
                                          'assets/images/image_not_found.png'),
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
                      ),
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
