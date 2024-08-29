import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utils/language_helper.dart';

class DetailsContentWidget extends StatefulWidget {
  const DetailsContentWidget({super.key, required this.movieInfo});

  final MovieModel movieInfo;

  @override
  State<DetailsContentWidget> createState() => _DetailsContentWidgetState();
}

class _DetailsContentWidgetState extends State<DetailsContentWidget> {
  late YoutubePlayerController _videoController;

  @override
  void initState() {
    _videoController = YoutubePlayerController(
      initialVideoId: widget.movieInfo.trailerKey ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.movieInfo.releaseDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      NumberFormat('#.0').format(widget.movieInfo.voteAverage),
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
                      LanguageHelper.getLanguage(widget.movieInfo.originalLanguage),
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
                      widget.movieInfo.adult ? 'Yes' : 'No',
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Adult',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(date),
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Release date',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: Colors.white,
                        fontSize: 14,
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
              widget.movieInfo.overview,
              softWrap: true,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Divider(thickness: 1.5),
          ),
          Text(
            'Movie Trailer',
            softWrap: true,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          YoutubePlayer(
            controller: _videoController,
            showVideoProgressIndicator: true,
            onReady: () {
              _videoController.addListener(() {});
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
