import 'package:flutter/material.dart';

class MovieDetailsFailure extends StatelessWidget {
  MovieDetailsFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: theme.colorScheme.background,
      child: Center(
        child: Text('Oops... ocorreu um erro'),
      ),
    );
  }
}
