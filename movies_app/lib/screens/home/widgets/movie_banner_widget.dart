import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/bloc/home_state.dart';

import '../../../bloc/home_cubit.dart';

class MovieBannerWidget extends StatefulWidget {
  const MovieBannerWidget({super.key, required this.posterPath, });

  final String posterPath;

  @override
  State<MovieBannerWidget> createState() => _MovieBannerWidgetState();
}

class _MovieBannerWidgetState extends State<MovieBannerWidget> {
  final HomeCubit _cubit = Modular.get<HomeCubit>();
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {},
          builder: (context, state) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 69, 34, 139),
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Image.network('${state.apiConfigurations!.images.baseUrl}original/${widget.posterPath.split('/').last}', fit: BoxFit.fitWidth),
      ),
    );
  }
}
