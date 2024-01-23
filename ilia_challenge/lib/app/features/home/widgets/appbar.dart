// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/colors.dart';

import 'package:ilia_challenge/app/constants/constants.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showHeartButton;

  const DefaultAppBar({
    Key? key,
    required this.showBackButton,
    required this.showHeartButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        'assets/images/flix.png',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline),
          color: Colors.black,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
