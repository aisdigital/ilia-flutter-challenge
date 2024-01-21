import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_failure_component.dart';

class IliaflixMovieNotFound extends StatelessWidget {
  const IliaflixMovieNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: IliaflixFailureComponent(
        failureDescription: 'Filme não encontrado!',
      ),
    );
  }
}
