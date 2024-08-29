import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/screens/home/widgets/list_card.dart';

import '../../../bloc/home_cubit.dart';
import '../../../bloc/home_state.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({super.key});

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
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
        builder: (context, state) => Stack(children: [
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
              const CustomScrollView(
                slivers: [
                  ListCard(),
                ],
              ),
            ]));
  }
}
