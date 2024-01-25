import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/movie.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsLoadMovieEvent>(detailsInitialEvent);
  }

  FutureOr<void> detailsInitialEvent(
      DetailsLoadMovieEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoadingState());
    try {
      emit(DetailsLoadedSuccessState(movie: event.clickedMovie));
    } catch (e) {
      emit(DetailsErrorState());
    }
  }
}
