import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home/widgets/carousel_widget.dart';

import '../../blocs/home_bloc/home_cubit.dart';
import '../../blocs/home_bloc/home_state.dart';

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
          listener: (context, state) {
            
          },
          builder: (context, state) => Scaffold(
            extendBodyBehindAppBar: true,
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
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            body: Stack(children: [
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
              CarouselWidget(movies: state.movies),
            ]),
          ),
        ));
  }
}
