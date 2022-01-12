import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/search_filmes_usecases.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/search_filmes/search_filmes_state.dart';

class SearchFilmesCubit extends Cubit<SearchFilmesState> {

  final SearchFilmesUsecases searchFilmesUsecases;
  SearchFilmesCubit(this.searchFilmesUsecases) : super(SearchFilmesInitial());

  Future<void> searchFilmes(String busca) async {
    emit(SearchFilmesLoading());
    if (busca.isEmpty) {
      emit(SearchFilmesNoResult());
      return;
    }
    var result = await searchFilmesUsecases(busca);
    result.fold(
      (error) => emit(SearchFilmesFailure(error: error)), 
      (sucess) => emit(SearchFilmesSucess(sucess)),
    );
  }
  
}