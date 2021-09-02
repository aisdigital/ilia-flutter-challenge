import 'package:mobx/mobx.dart';

import 'core/domain/usecases/get_connectivity_stream_usecase.dart';
import 'core/usecases/usecase.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final GetConnectivityStreamUseCase _getConnectivityStreamUseCase;

  _AppControllerBase(
      {required GetConnectivityStreamUseCase getConnectivityStreamUseCase})
      : _getConnectivityStreamUseCase = getConnectivityStreamUseCase {
    _listenConnectivityChange();
  }

  @observable
  bool isConnected = true;

  @action
  Future<void> _listenConnectivityChange() async {
    final failureOrBool = await _getConnectivityStreamUseCase(NoParams());
    failureOrBool.fold(
      (failure) => isConnected = false,
      (stream) {
        stream.listen((internetConnection) {
          isConnected = internetConnection;
        });
      },
    );
  }
}
