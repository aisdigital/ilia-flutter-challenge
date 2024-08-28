import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home/widgets/carousel_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Cinema',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.titleLarge,
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
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
        CarouselWidget(movies: movies)
      ]),
    );
  }
}
