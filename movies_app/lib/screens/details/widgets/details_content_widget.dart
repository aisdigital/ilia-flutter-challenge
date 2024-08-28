import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsContentWidget extends StatelessWidget {
  const DetailsContentWidget({super.key, required this.movies});

  final List<String> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '6.3',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Score',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'English',
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Language',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '53%',
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Popularity',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: Text(
              'Lorem ipsum dolor sit amet. Aut consequuntur temporibus ea tempora quisquam vel ipsum ipsam? Et quia laborum aut voluptatem deserunt nam distinctio sequi. Et omnis praesentium ea sint nemo et explicabo perspiciatis. Sed accusamus numquam qui magnam voluptas aut quasi corrupti.',
              softWrap: true,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: const Icon(
              Icons.play_circle_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
