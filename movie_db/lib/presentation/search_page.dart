import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/application/search_page_controller.dart';

import 'movie_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Get.put(
    SearchPageController(),
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
        automaticallyImplyLeading: true,
        title: Center(
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Obx(
                () => TextFormField(
                  controller: _controller.searchTextEditingController.value,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                      hintText: 'Pesquisar...',
                      border: InputBorder.none),
                  onFieldSubmitted: (query) {
                    _controller.loadCount.value = 1;
                    _controller.search(
                      query,
                      _controller.loadCount.value,
                    );
                  },
                ),
              ),
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
