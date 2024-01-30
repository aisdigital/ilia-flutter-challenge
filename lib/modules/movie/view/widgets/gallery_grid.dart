import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({
    super.key,
    required this.gallery,
  });

  final List gallery;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemCount: gallery.length > 6 ? 6 : gallery.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              imageUrl: gallery[index]),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
