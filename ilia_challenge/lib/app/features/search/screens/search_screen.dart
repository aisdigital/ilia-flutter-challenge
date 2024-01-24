import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';
import '../widgets/custom_list_card_widget.dart';


// class MovieSearch {
//   final String title;
//   final String posterPath;

//   MovieSearch({
//     required this.title,
//     required this.posterPath,
//   });

//   factory MovieSearch.fromJson(Map<String, dynamic> json) {
//     return MovieSearch(
//       title: json['title'],
//       posterPath: json['poster_path'],
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movies;
  TextEditingController searchController = TextEditingController();
  List<Movie> allMovies = [];
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    super.initState();
    movies = fetchAllMovies(currentPage);

    // Adicione um listener ao controlador de rolagem
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Se estiver no final da lista, carregue a próxima página
        currentPage++;
        loadNextPage();
      }
    });
  }

    // Adicione este método para carregar a próxima página
  void loadNextPage() async {
    List<Movie> nextPage = await fetchAllMovies(currentPage);
    setState(() {
  movies = Future.value(allMovies);
    });
  }

Future<List<Movie>> fetchAllMovies(int page) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&page=$page'),
    );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final moviesOnPage = decodedData.map((movie) => Movie.fromJson(movie)).toList();

      // Se estiver na primeira página, atualize a lista completa
if (page == 1) {
  // Não substitua a lista existente, apenas adicione à lista
  allMovies.addAll(moviesOnPage);
} else {
  // Adicione à lista existente
  allMovies.addAll(moviesOnPage);
}

      return allMovies;
    } else {
      throw Exception('Failed to load movies');
    }
  }



  List<Movie> filterMovies(String query) {
    return allMovies
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40, 
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  setState(() {
                    movies = Future.value(filterMovies(query));
                  });
                },
                style: TextStyle(color: Colors.white), // Cor do texto
                cursorColor: Colors.white, // Cor do cursor
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by title',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No movies available.'),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      crossAxisSpacing:
                          0.0, 
                      mainAxisSpacing:
                          0.0, 
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final movie = snapshot.data![index];
                      return CustomListCardWidget(
                        movie: movie,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

