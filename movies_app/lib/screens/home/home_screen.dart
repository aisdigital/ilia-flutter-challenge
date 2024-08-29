import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home/widgets/home_carousel_view.dart';

import '../../bloc/home_cubit.dart';
import '../../bloc/home_state.dart';
import 'widgets/home_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeCubit _cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          _cubit.reload();
          return Future.value();
        },
        child: BlocConsumer<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            extendBodyBehindAppBar: state.isListView ? false : true,
            appBar: AppBar(
              title: Text(
                'Cinema',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: state.isListView ? const Color(0xFF3D2D63) : Colors.transparent,
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.auto_awesome_mosaic_outlined, color: Colors.white),
                  onPressed: () {
                    if (state.isListView) {
                      _cubit.setIsListView(false);
                    } else {
                      _cubit.setIsListView(true);
                    }
                  },
                ),
              ],
            ),
            body: state.isListView ? const HomeListView() : HomeCarouselView(movies: state.movies),
          ),
        ));
  }
}
