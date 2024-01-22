import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/store/movie_details_store.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_genre_card.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_movie_details_title_section_component.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_movie_poster.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/widgets/iliaflix_watch_video_button.dart';

class IliaflixMovieDetailsComponent extends StatelessWidget {
  const IliaflixMovieDetailsComponent({
    super.key,
    required this.store,
  });

  final MovieDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<MovieDetailsStore, MovieDetailsState>(
        bloc: store,
        builder: (context, state) {
          final MovieDetails movieDetails = state.movieDetails;
          final MovieVideos movieVideos = state.movieVideos;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IliaflixMoviePoster(posterPath: movieDetails.posterPath!),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Text(
                    movieDetails.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(movieDetails.voteAverage!.toString()),
                    ],
                  ),
                  Text('${movieDetails.voteCount} voto(s)'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    movieDetails.overview! == ''
                        ? 'O filme em questão não possui descrição.'
                        : movieDetails.overview!,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              movieDetails.genres!.isEmpty
                  ? Container()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const IliaflixMovieDetailsTitleSectionComponent(
                            sectionName: 'Gêneros:',
                          ),
                          const SizedBox(width: 5),
                          for (int i = 0; i < movieDetails.genres!.length; i++)
                            IliaflixGenreCard(
                              genreName: movieDetails.genres![i]['name'],
                            )
                        ],
                      ),
                    ),
              movieVideos.results!.isEmpty
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: IliaflixMovieDetailsTitleSectionComponent(
                            sectionName: 'Vídeos:',
                          ),
                        ),
                        for (int i = 0; i < movieVideos.results!.length; i++)
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  '${movieVideos.results![i]['name']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 10),
                              IliaflixWatchVideoButton(
                                onTapWatchVideoButton: () async {
                                  await store.searchVideo(
                                      videoId: movieVideos.results![i]['key']);
                                },
                              )
                            ],
                          ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
