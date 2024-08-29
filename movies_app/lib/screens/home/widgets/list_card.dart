import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../bloc/home_cubit.dart';
import '../../../bloc/home_state.dart';
import '../../../utils/language_helper.dart';

class ListCard extends StatefulWidget {
  const ListCard({super.key});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final HomeCubit _cubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: _cubit,
        listener: (context, state) {},
        builder: (context, state) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () async {
                        final trailerKey = _cubit.getTrailer(state.movies[index].id.toString());
                        _cubit.setSelectedMovie(state.movies[index]);
                        Navigator.of(context).pushNamed('/details/:$trailerKey');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: const Color(0xFF321347),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Image.network(
                                      '${state.apiConfigurations!.images.baseUrl}original/${state.movies[index].posterPath.split('/').last}',
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.movies[index].title,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Language: ',
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelLarge,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            LanguageHelper.getLanguage(state.movies[index].originalLanguage),
                                            softWrap: true,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context).textTheme.labelLarge,
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          'Score: ',
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelLarge,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          NumberFormat('#.0').format(state.movies[index].voteAverage),
                                          softWrap: true,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelLarge,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: state.movies.length,
              ),
            ));
  }
}
