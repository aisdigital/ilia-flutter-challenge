import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/get_filmes_popular.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/get_filmes_rated.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_rated/filmes_rated_state.dart';

class FilmesRatedCubit extends Cubit<FilmesRatedState> {
  final GetFilmesRatedUsecases getFilmesRatedUsecases;
  FilmesRatedCubit(this.getFilmesRatedUsecases) : super(FilmesRatedInitial());
  

  Future<void> getFilmesRated() async {
    emit(FilmesRatedLoading());
    var result = await getFilmesRatedUsecases();
    result.fold(
      (error) => emit(FilmesRatedFailure(error: error)), 
      (sucess) => emit(FilmesRatedSucess(list: sucess))
    );
  }
}