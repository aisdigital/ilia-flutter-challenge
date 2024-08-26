import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/screens/widgets/button_widget.dart';
import 'package:ilia_flutter_challenge/shared/models/movie_model.dart';
import 'package:ilia_flutter_challenge/shared/utils/api_utils.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';
import 'package:ilia_flutter_challenge/theme/app_text_styles.dart';

class DetailsPage extends StatefulWidget {
  final MovieModel movie;
  const DetailsPage({super.key, required this.movie});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.darkScaffoldColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: AppColors.darkMainAmber,
                )),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.darkScaffoldColor, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(bounds),
                blendMode: BlendMode.darken,
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Image.network(
                    ApiUtils.FETCH_IMAGE(widget.movie.poster_path),
                    semanticLabel: "${widget.movie.original_title} poster",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: SizedBox(
                              width: 24,
                              child:
                                  Image.asset("assets/images/imdb_logo.png")),
                        ),
                        Text(
                          widget.movie.vote_average.toStringAsFixed(1),
                          style: AppTextStyles.movieDetailsAverageVote,
                        )
                      ],
                    ),
                    Text(
                      widget.movie.title,
                      style: AppTextStyles.movieDetailsTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.movie.overview,
              style: AppTextStyles.movieDetailsOverview,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 4.0, bottom: 32),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.movie.release_date.substring(0, 4),
                        style: AppTextStyles.movieDetailsReleaseYear,
                      ),
                    ),
                  ),
                ),
                if (widget.movie.popularity > 3000)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              size: 16,
                            ),
                            Text(
                              "Trending",
                              style: AppTextStyles.movieDetailsReleaseYear,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (widget.movie.adult)
                  SizedBox(
                      height: 24, child: Image.asset("assets/images/18_1.png"))
              ],
            ),
          ),
          if (widget.movie.video)
            ButtonWidget(label: "Watch trailer", onClick: () {})
        ],
      ),
    );
  }
}
