import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/search_filmes/search_filmes_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/search_filmes/search_filmes_state.dart';
import 'package:teste_ilia/app/modules/home/presenter/widgets/card_filmes_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchCubit = Modular.get<SearchFilmesCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: TextFormField(
              autofocus: true,
              onChanged: (value) => searchCubit.searchFilmes(value),
              decoration: const InputDecoration(
                labelText: 'Pesquisar Filmes', 
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(20)
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<SearchFilmesCubit,SearchFilmesState>(
                bloc: searchCubit,
                builder: (context, state) {
                  if (state is SearchFilmesFailure) {
                    return Center(
                      child: Text(state.error.message),
                    );
                  }
                  if (state is SearchFilmesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchFilmesNoResult) {
                    return const Center(
                      child: Text('Sem resultados'),
                    );
                  }
                  if (state is SearchFilmesSucess) {
                    List<FilmeEntity> filmes = state.list;
                    return ListView.builder(
                      itemCount: filmes.length,
                      itemBuilder: (context, index) {
                        return CardFilmesWidget(filmes[index]);
                      }
                    );
                  }
                  return Container();
                }
              )

            ),
          ],
        ),
      ),
    );
  }
}