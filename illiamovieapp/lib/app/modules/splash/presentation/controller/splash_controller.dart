import 'package:mobx/mobx.dart';

import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/initializers_usecase.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final InitializersUseCase _initializersUseCase;

  _SplashControllerBase({required InitializersUseCase initializersUseCase})
      : _initializersUseCase = initializersUseCase {
    pipeline();
  }

  @observable
  ControlState state = ControlState.start;
  @observable
  String failureMessage = '';

  @action
  void _setFailureState(String message) {
    state = ControlState.failure;
    failureMessage = message;
  }

  Future<void> pipeline() async {
    state = ControlState.loading;
    final failureOrInitialize = await _initializersUseCase.call(NoParams());

    failureOrInitialize.fold(
      (failure) => _setFailureState('Não foi possível inicializar o app'),
      (initialize) => null,
    );
  }
}
