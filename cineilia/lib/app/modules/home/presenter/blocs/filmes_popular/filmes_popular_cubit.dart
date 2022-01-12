import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/get_filmes_popular.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_popular/filmes_popular_state.dart';

class FilmesPopularCubit extends Cubit<PopularState> {
  final GetFilmesPopularUsecases getFilmesPopularUsecases;

  FilmesPopularCubit(this.getFilmesPopularUsecases) : super(PopularInitialState());

  Future<void> getFilmesPopular() async {
    emit(PopularLoadingState());
    var result = await getFilmesPopularUsecases();
    result.fold(
      (error) => emit(PopularErrorState(error: error)), 
      (sucess) => emit(PopularSucessState(list: sucess))
    );
  }
}