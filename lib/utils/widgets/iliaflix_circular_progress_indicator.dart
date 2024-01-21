import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixCircularProgressIndicator extends StatelessWidget {
  const IliaflixCircularProgressIndicator(
      {super.key,
      required this.isSearch,
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
              CircularProgressIndicator(
                color: AppColors.vividRed,
              ),
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
