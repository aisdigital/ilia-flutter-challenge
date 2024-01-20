import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/utils/app_colors.dart';

class IliaflixPagesCounter extends StatefulWidget {
  const IliaflixPagesCounter({super.key, required this.store});

  final HomeStore store;

  @override
  State<IliaflixPagesCounter> createState() => _IliaflixPagesCounterState();
}

class _IliaflixPagesCounterState extends State<IliaflixPagesCounter> {
  HomeStore get store => widget.store;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<HomeStore, HomeState>(
          bloc: store,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  for (int i = 1; i <= state.nowPlayingMovies.totalPages; i++)
                    GestureDetector(
                      onTap: () => store.changePageNumber(i.toString()),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        height: MediaQuery.of(context).size.width / 8,
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          color: i == int.parse(state.pageNumber)
                              ? AppColors.vividRed
                              : AppColors.darkGrey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(i.toString()),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
