import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'movie_banner_widget.dart';
import 'movie_description_widget.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.movies});

  final List<String> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed('/details'),
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: movies.map((title) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MovieBannerWidget(),
                      const SizedBox(height: 20),
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MovieDescriptionWidget(
                        movies: movies
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
