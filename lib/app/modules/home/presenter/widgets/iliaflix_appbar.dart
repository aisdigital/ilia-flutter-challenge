import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixAppbar extends StatelessWidget implements PreferredSizeWidget {
  const IliaflixAppbar({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.vividRed,
      centerTitle: true,
      title: const Text('ÍliaFlix'),
    );
  }

  @override
  Size get preferredSize => Size(
        MediaQuery.of(context).size.width,
        56,
      );
}
