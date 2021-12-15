import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db/application/home_page_controller.dart';
import 'package:movie_db/presentation/search_page.dart';

import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(
    HomePageController(),
  );
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _controller.loadMore();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 2,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.redAccent[400],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
        ],
        title: Center(
          child: Text(
            'Em Cartaz'.toUpperCase(),
            style: GoogleFonts.baloo(
              color: Colors.redAccent[400],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Obx(
        () => GridView.builder(
          controller: scrollController,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          itemCount: _controller.movieList.value != null
              ? _controller.movieList.value!.length
                  .clamp(0, (_controller.loadCount.value * 20))
              : 0,
          itemBuilder: (context, index) {
            var movie = _controller.movieList.value![index];
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MoviePage(
                    movie,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: movie.backdropPath != null
                        ? 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
                        : 'https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1',
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/image_not_found.png'),
                        ),
                      ),
                    ),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
