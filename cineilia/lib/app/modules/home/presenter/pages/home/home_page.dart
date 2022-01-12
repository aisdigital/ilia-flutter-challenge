import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_popular/filmes_popular_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_popular/filmes_popular_state.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_rated/filmes_rated_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_rated/filmes_rated_state.dart';
import 'package:teste_ilia/app/modules/home/presenter/pages/seach/seach_page.dart';
import 'package:teste_ilia/app/modules/home/presenter/widgets/card_filmes_widget.dart';
import 'package:teste_ilia/app/modules/home/presenter/widgets/card_top_rated_widget.dart';
import 'package:teste_ilia/app/shared/widgets/shader_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final filmesPopularCubit = Modular.get<FilmesPopularCubit>();
  final filmesRatedCubit = Modular.get<FilmesRatedCubit>();

  @override
  void initState() {
    super.initState();
    filmesPopularCubit.getFilmesPopular();
    filmesRatedCubit.getFilmesRated();
  }
  @override
  void dispose() {
    filmesPopularCubit.close();
    filmesRatedCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderWidget(
                    child: const Text('Ília filmes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                    )
                  ),
                  ShaderWidget(
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SearchPage())
                        );
                      },
                      iconSize: 30,
                      color: Colors.white, 
                      icon: const Icon(Icons.search)
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Text('Filmes Top Rated',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  child: BlocBuilder<FilmesRatedCubit, FilmesRatedState>(
                    bloc: filmesRatedCubit,
                    builder: (context, state) {

                      if (state is FilmesRatedFailure) {
                        return const Center(
                          child: Text('Error ao carregar daddos'),
                        );
                      }

                      if(state is FilmesRatedLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is FilmesRatedSucess) {
                        List<FilmeEntity> dados = state.list;
                        if (dados.isEmpty) {
                          return const Center(
                            child: Text('Sem filmes'),
                          );
                        }
                        return CarouselSlider.builder(
                          itemCount: dados.length, 
                          itemBuilder: (context,index,i){
                            return CardTopRatedWidget(dados[index]);
                          }, 
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                        );
                      }
                      return Container();
                    }
                  ),
                ),
              ),              
              const Text('Filmes populares',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<FilmesPopularCubit,PopularState>(
                  bloc: filmesPopularCubit,
                  builder: (context, state) {

                    if(state is PopularErrorState){
                      return const Center(
                        child: Text('Ocooreu um erro'),
                      );
                    }

                    if(state is PopularLoadingState){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(state is PopularSucessState){
                      List<FilmeEntity> dados = state.list;
                      return ListView.builder(
                        itemCount: dados.length,
                        itemBuilder: (contex,index){
                          return CardFilmesWidget(dados[index]);
                        },
                      );
                    }

                    return Container();

                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}