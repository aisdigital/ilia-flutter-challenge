import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movie_model.dart';
import 'widgets/details_content_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> movies = [
    'Saw',
    'Harry Potter',
    'Lord of The Rings',
    'Fast and Furious',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xFF321347),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Harry Potter',
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
          SliverFillRemaining(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF612CCC), Color(0xFF9771FF)],
                    ),
                  ),
                ),
                DetailsContentWidget(movies: movies)
              ],
            ),
          )
        ],
      ),
    );
  }
}
