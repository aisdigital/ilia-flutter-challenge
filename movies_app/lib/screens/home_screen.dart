import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/movie_model.dart';
import '../services/get_movies_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> movies = [
    'Saw',
    'Harry Potter',
    'Lord of The Rings',
    'Fast and Furious',
  ];

  List<dynamic> moviesData = [
    10.25,
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF321347),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Cinema',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              background: Center(
                child: Text(
                  'Background',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, "/details");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: const Color(0xFF321347),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.amberAccent,
                                ),
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                                // child: const Image(image: AssetImage('assets/icons/company.png')),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movies[index],
                                    softWrap: true,
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.labelLarge,
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'Language: ',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          moviesData[1],
                                          softWrap: true,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelLarge,
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        'Vote average: ',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        moviesData[0].toString(),
                                        softWrap: true,
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }
}
