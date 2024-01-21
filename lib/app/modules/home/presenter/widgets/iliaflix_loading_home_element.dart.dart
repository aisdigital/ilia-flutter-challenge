import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/widgets/iliaflix_circular_progress_indicator.dart';

class IliaflixLoadingHomeElement extends StatelessWidget {
  const IliaflixLoadingHomeElement(
      {super.key,
      this.isSearch = false,
      this.currentSearchPage,
      this.totalPages});

  final bool isSearch;
  final String? currentSearchPage;
  final String? totalPages;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const IliaflixCircularProgressIndicator(),
              isSearch
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Pesquisa realizada em: $currentSearchPage de $totalPages páginas',
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
