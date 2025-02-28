import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_cinema/app/core/utils/modular_injector.dart';
import 'package:pixel_cinema/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pixel_cinema/app/modules/home/presentation/pages/search_page.dart';
import 'package:pixel_cinema/app/modules/home/presentation/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularInjector<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pixel Cinema'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage())),
              icon: const Icon(Icons.search_rounded),
            ),
          ],
        ),
        body: controller.store.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) => controller.onScrollFetch(scrollInfo),
                  child: ListView.builder(
                    itemCount: controller.store.movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: controller.store.movies[index], controller: controller);
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
