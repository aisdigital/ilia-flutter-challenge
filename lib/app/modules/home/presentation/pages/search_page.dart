import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_cinema/app/core/utils/modular_injector.dart';
import 'package:pixel_cinema/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pixel_cinema/app/modules/home/presentation/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularInjector<SearchPage, HomeController> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search for a movie...',
              labelText: 'Search for a movie...',
              hintStyle: TextStyle(color: Colors.white54),
            ),
            style: const TextStyle(color: Colors.black),
            onSubmitted: (query) async {
              await controller.searchMovies(query);
            },
          ),
        ),
        body: controller.store.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.store.searchResults.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(18),
                    child: Text('Busca vazia'),
                  )
                : ListView.builder(
                    itemCount: controller.store.searchResults.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: controller.store.searchResults[index], controller: controller);
                    },
                  ),
      ),
    );
  }
}
