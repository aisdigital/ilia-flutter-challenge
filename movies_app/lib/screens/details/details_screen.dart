import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/home_cubit.dart';
import '../../bloc/home_state.dart';
import 'widgets/details_content_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.trailerKey});

  final String trailerKey;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final HomeCubit _cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xFF3D2D63),
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: [
                  Text(
                  state.selectedMovie!.title,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              background: Image.network(
                '${state.apiConfigurations!.images.baseUrl}original/${state.selectedMovie!.posterPath.split('/').last}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF612CCC), Color(0xFF9771FF)],
                    ),
                  ),
                ),
                DetailsContentWidget(movieInfo: state.selectedMovie!)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
