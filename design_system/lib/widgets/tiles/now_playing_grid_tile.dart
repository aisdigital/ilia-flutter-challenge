import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/constant/env.dart';
import 'package:core/util/context_x.dart';
import 'package:design_system/widgets/common/element_shrinker.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingGridTile extends StatelessWidget {
  final String title, rating, overview;
  final String? posterPath;
  final List<String>? genres;
  final VoidCallback? onTap;

  const NowPlayingGridTile({
    super.key,
    required this.title,
    required this.rating,
    required this.overview,
    this.posterPath,
    this.genres,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return ElementShrinker(
      onTap: () => onTap?.call(),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: '$imageBaseUrl/w200/$posterPath',
              fit: BoxFit.cover,
              width: 160,
              height: 220,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.white70,
                highlightColor: Colors.white38,
                child: Container(
                  width: 100,
                  height: 150,
                  color: Colors.white38,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                child: const Icon(Icons.error),
                width: 100,
                height: 150,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width / 1.8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(rating, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
