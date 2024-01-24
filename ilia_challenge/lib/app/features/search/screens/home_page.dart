import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/utils/widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/widgets/custom_list_card_widget.dart';


class Movie {
  final String title;
  final String posterPath;

  Movie({
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movies;
  TextEditingController searchController = TextEditingController();
  List<Movie> allMovies = [];

  @override
  void initState() {
    super.initState();
    movies = fetchAllMovies();
  }

Future<List<Movie>> fetchAllMovies() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}'),
  );

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)['results'] as List;
    allMovies = decodedData.map((movie) => Movie.fromJson(movie)).toList();
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
              height: 40, // Ajuste a altura conforme necessário
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  setState(() {
                    // Update the movies list based on the search query
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
                      crossAxisCount: 2, // Número de colunas
                      crossAxisSpacing:
                          0.0, // Espaçamento horizontal entre os itens
                      mainAxisSpacing:
                          0.0, // Espaçamento vertical entre os itens
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
// ...
