import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/circular_loader.dart';

class MovieDetailsLoading extends StatelessWidget {
  MovieDetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: theme.colorScheme.background,
      child: Center(
        child: CircularLoader(
          primaryColor: theme.colorScheme.primary,
          secondaryColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
