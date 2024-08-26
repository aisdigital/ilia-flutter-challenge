import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/constant/env.dart';
import 'package:core/util/context_x.dart';
import 'package:design_system/widgets/common/element_shrinker.dart';
import 'package:design_system/widgets/common/tag.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingMovieListTile extends StatelessWidget {
  final String title, rating, overview;
  final String? posterPath, releaseDate;
  final List<String>? genres;
  final VoidCallback? onTap;

  const NowPlayingMovieListTile({
    super.key,
    required this.title,
    required this.rating,
    required this.overview,
    this.posterPath,
    this.genres,
    this.releaseDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return ElementShrinker(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: '$imageBaseUrl/w200/$posterPath',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.white70,
                      highlightColor: Colors.white38,
                      child: Container(
                        width: 70,
                        height: 70,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      child: const Icon(Icons.error),
                      width: 70,
                      height: 70,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width / 1.8),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Tag(
                            child: Row(
                              children: [
                                Icon(Icons.star_rounded, color: Colors.amber),
                                Text(rating, style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                          if (releaseDate != null)
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Tag(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        size: 17,
                                      ),
                                      SizedBox(width: 5),
                                      Text(releaseDate.toString(), style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
