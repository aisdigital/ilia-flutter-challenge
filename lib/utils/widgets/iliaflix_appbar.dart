import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixAppbar extends StatelessWidget implements PreferredSizeWidget {
  const IliaflixAppbar(
      {super.key, required this.context, this.isNeededToPop = false});

  final BuildContext context;
  final bool isNeededToPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isNeededToPop
          ? IconButton(
              onPressed: () => Modular.to.pop(),
              icon: const Icon(Icons.arrow_back),
            )
          : null,
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
