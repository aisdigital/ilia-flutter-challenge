import 'package:core/util/context_x.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/widgets/common/element_shrinker.dart';
import 'package:design_system/widgets/common/tag.dart';
import 'package:flutter/material.dart';

class MovieVideoTile extends StatelessWidget {
  final String videoKey, name, type;
  final VoidCallback onTap;

  const MovieVideoTile({
    super.key,
    required this.videoKey,
    required this.name,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElementShrinker(
      onTap: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                height: 80,
                width: 100,
                imageUrl: 'https://img.youtube.com/vi/${videoKey}/mqdefault.jpg',
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                ),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: context.screenSize.width / 2),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Tag(
                  child: Text(type, style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
