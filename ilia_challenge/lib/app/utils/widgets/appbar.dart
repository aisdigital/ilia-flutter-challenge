// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    Key? key,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
