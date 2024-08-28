import 'package:movies_app/models/movie_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/movie_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    @Default(false) bool hasError,
    @Default(false) bool isBusy,
    @Default(false) bool couponPurchaseSucess,
    @Default('') String errorMessage,
    @Default([]) List<MovieModel> moviesInfo,
    MovieRequestModel? moviesRequest,
    MovieModel? selectedMovie,
  }) = _HomeState;
}
