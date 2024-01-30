import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieState(movie: Movie()));

  List<String> handleMovieVideoLinks(List<Video> videos) {
    final result = <String>[];
    if (videos.isEmpty) return result;

    for (Video video in videos) {
      if (video.site == 'YouTube' && (video.key?.isNotEmpty ?? false)) {
        result.add(video.key!);
      }
    }

    return result;
  }

  Map<String, List> handleMoviePostersLinks({
    required Images? images,
    required MediaConfig? config,
  }) {
    final result = <String, List>{};

    if (images == null) return result;

    const imageApi = Config.imageApi;
    final path = MovieSection.media.path;
    final backdropSizes = config?.backdropSizes ?? [];
    final logoSizes = config?.logoSizes ?? [];
    final posterSizes = config?.posterSizes ?? [];

    int? backdropMiddle =
        posterSizes.length > 2 ? (backdropSizes.length / 2).ceil() : null;
    int? logoMiddle =
        posterSizes.length > 2 ? (logoSizes.length / 2).ceil() : null;
    int? posterMiddle =
        posterSizes.length > 2 ? (posterSizes.length / 2).ceil() : null;

    final backdropSize =
        backdropMiddle != null ? backdropSizes[backdropMiddle] : null;
    final logoSize = logoMiddle != null ? logoSizes[logoMiddle] : null;
    final posterSize = posterMiddle != null ? posterSizes[posterMiddle] : null;

    final rawBackdrops = List<Backdrops>.from(images.backdrops ?? []);
    final rawLogos = List<Logos>.from(images.logos ?? []);
    final rawPosters = List<Posters>.from(images.posters ?? []);

    final backdrops = [];
    final logos = [];
    final posters = [];

    for (Backdrops element in rawBackdrops) {
      final filePath = element.filePath ?? '';
      if (backdropSize == null || filePath.isEmpty) continue;
      backdrops.add('$imageApi$path/$backdropSize$filePath}');
    }
    for (Logos element in rawLogos) {
      final filePath = element.filePath ?? '';
      if (logoSize == null || filePath.isEmpty) continue;
      logos.add('$imageApi$path/$logoSize$filePath}');
    }
    for (Posters element in rawPosters) {
      final filePath = element.filePath ?? '';
      if (posterSize == null || filePath.isEmpty) continue;
      posters.add('$imageApi$path/$posterSize$filePath}');
    }

    result['backdrops'] = backdrops;
    result['logos'] = logos;
    result['posters'] = posters;
    return result;
  }
}
